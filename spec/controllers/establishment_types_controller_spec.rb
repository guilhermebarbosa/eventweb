require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EstablishmentTypesController do

  # This should return the minimal set of attributes required to create a valid
  # EstablishmentType. As you add validations to EstablishmentType, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all establishment_types as @establishment_types" do
      establishment_type = EstablishmentType.create! valid_attributes
      get :index
      assigns(:establishment_types).should eq([establishment_type])
    end
  end

  describe "GET show" do
    it "assigns the requested establishment_type as @establishment_type" do
      establishment_type = EstablishmentType.create! valid_attributes
      get :show, :id => establishment_type.id.to_s
      assigns(:establishment_type).should eq(establishment_type)
    end
  end

  describe "GET new" do
    it "assigns a new establishment_type as @establishment_type" do
      get :new
      assigns(:establishment_type).should be_a_new(EstablishmentType)
    end
  end

  describe "GET edit" do
    it "assigns the requested establishment_type as @establishment_type" do
      establishment_type = EstablishmentType.create! valid_attributes
      get :edit, :id => establishment_type.id.to_s
      assigns(:establishment_type).should eq(establishment_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new EstablishmentType" do
        expect {
          post :create, :establishment_type => valid_attributes
        }.to change(EstablishmentType, :count).by(1)
      end

      it "assigns a newly created establishment_type as @establishment_type" do
        post :create, :establishment_type => valid_attributes
        assigns(:establishment_type).should be_a(EstablishmentType)
        assigns(:establishment_type).should be_persisted
      end

      it "redirects to the created establishment_type" do
        post :create, :establishment_type => valid_attributes
        response.should redirect_to(EstablishmentType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved establishment_type as @establishment_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        EstablishmentType.any_instance.stub(:save).and_return(false)
        post :create, :establishment_type => {}
        assigns(:establishment_type).should be_a_new(EstablishmentType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EstablishmentType.any_instance.stub(:save).and_return(false)
        post :create, :establishment_type => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested establishment_type" do
        establishment_type = EstablishmentType.create! valid_attributes
        # Assuming there are no other establishment_types in the database, this
        # specifies that the EstablishmentType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        EstablishmentType.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => establishment_type.id, :establishment_type => {'these' => 'params'}
      end

      it "assigns the requested establishment_type as @establishment_type" do
        establishment_type = EstablishmentType.create! valid_attributes
        put :update, :id => establishment_type.id, :establishment_type => valid_attributes
        assigns(:establishment_type).should eq(establishment_type)
      end

      it "redirects to the establishment_type" do
        establishment_type = EstablishmentType.create! valid_attributes
        put :update, :id => establishment_type.id, :establishment_type => valid_attributes
        response.should redirect_to(establishment_type)
      end
    end

    describe "with invalid params" do
      it "assigns the establishment_type as @establishment_type" do
        establishment_type = EstablishmentType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EstablishmentType.any_instance.stub(:save).and_return(false)
        put :update, :id => establishment_type.id.to_s, :establishment_type => {}
        assigns(:establishment_type).should eq(establishment_type)
      end

      it "re-renders the 'edit' template" do
        establishment_type = EstablishmentType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EstablishmentType.any_instance.stub(:save).and_return(false)
        put :update, :id => establishment_type.id.to_s, :establishment_type => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested establishment_type" do
      establishment_type = EstablishmentType.create! valid_attributes
      expect {
        delete :destroy, :id => establishment_type.id.to_s
      }.to change(EstablishmentType, :count).by(-1)
    end

    it "redirects to the establishment_types list" do
      establishment_type = EstablishmentType.create! valid_attributes
      delete :destroy, :id => establishment_type.id.to_s
      response.should redirect_to(establishment_types_url)
    end
  end

end