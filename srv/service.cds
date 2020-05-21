using mypro from '../db/schema';

service TwitteruserService {
  entity Twitterusers as projection on mypro.Twitterusers;
};

annotate TwitteruserService.Twitterusers with @(UI : {
  HeaderInfo          : {
    TypeName       : 'Twitter user to follow',
    TypeNamePlural : 'Twitter users to follow',
    Title          : {
      $Type : 'UI.DataField',
      Value : name
    }
  },
  SelectionFields     : [
  id,
  name
  ],
  LineItem            : [
  {
    $Type : 'UI.DataField',
    Value : imageurl
  },
  {
    $Type : 'UI.DataField',
    Value : name
  }
  ],
  Facets              : [{
    $Type  : 'UI.ReferenceFacet',
    Label  : 'User Details',
    Target : '@UI.FieldGroup#Details'
  }],
  FieldGroup #Details : {Data : [
  {
    Value : name,
    Label : 'Name'
  },
  {
    Value : imageurl,
    Label : 'Profile Image'
  }
  ]}
});

annotate TwitteruserService.Twitterusers with {
  imageurl @(
    Common.Label  : 'Profile Image',
    UI.IsImageURL : true
  );
  id       @(Common : {Label : 'id'});
  name     @(Common : {Label : 'Twitter user'});
}
