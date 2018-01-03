package com.proxybanque_KO_JFA.rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import com.proxybanque_KO_JFA.entity.Client;
import com.proxybanque_KO_JFA.entity.Conseiller;

@Produces({"application/XML", "application/JSON"})
public interface ITestServe {
	
	@GET
	@Path("/clients/{idcli}/")
	public Client getClientById(@PathParam (value="id=Cli") Long idCli);
	
	@GET
	@Path("/clients")
	public List<Client> listClient();
	
	@GET
	@Path("/conseiller/{login}/{psw}/")
	public Conseiller login(@PathParam("login") String login, @PathParam("psw") String psw);
}
