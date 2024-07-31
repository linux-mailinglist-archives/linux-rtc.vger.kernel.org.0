Return-Path: <linux-rtc+bounces-1648-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C71942F1A
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 14:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D6A81C22C09
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 12:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4DD1B143F;
	Wed, 31 Jul 2024 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EBNmZFw1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013016.outbound.protection.outlook.com [52.101.67.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664721B0122;
	Wed, 31 Jul 2024 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430204; cv=fail; b=p0UbBsSfeMTjICiabEtaXqZX0SZ+K9SSMoJUOQLudE6efoQeyCeZfM4Q5A4+I4akqzAKUQe+sSrxytF/BKEvHIwE89Z5jC6eUACJAYuxTLTO4c2MAA6Xn69aIMjX/yCvLyiDm+qbAHV2GO1mxsB1C87VylS8lYXtwdFLrsCSHlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430204; c=relaxed/simple;
	bh=+VGpcOt4DYKjt4MwlYIpY4DsHNljSB2Wr4oWn8HrdCU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aOgaF2fdwSRdwJu3HJwR5cr+sQ6x1jnaGQor1FmX5ka5F/oizrF5GUIjwovmTKesfyNhluuFweTd8M7XmNvU/6x4dkmj7ZNVnoKN+yjWWoIVKZmWOeRk5mYWd3uP6a4NmGVVRBr6Enn0pp9hv8nQIlZPqSXbh27VUjOdZ/Bl+co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EBNmZFw1; arc=fail smtp.client-ip=52.101.67.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ea0E9ReIDsRuSn0r7R0Xo05Gn3G1VRDTKIr9c6wGjzzm34flAzASAQSAicHiMubqqyV6CnCQ0nNPS4RvteU7AmfXeoujwYHQnWXbqwEsnYyyKG6V8L0V/Ty1r9gsPqnMxzNOaLXykJl0Svv5xxM3+EluLUtolK5nNJU88sPHYh9uIVuiPrn6xvdY1cYYyAiczZhgdNT28S1dpe6CZs5oYYPVVCKSUAwC3CZAvHyLsjZHWporE0pL022O6nqydzEYhydNlf21pPG0i+XqIs+XFo3uHQOPtgFRbF6lwAbcdVd4qZVn5n99TTGqqyXaMWhCuzNbrQWWJiZwuKZCt1yu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hKBoiq+s/+zz2f2tOfKhftCRfaN0Ib7L8IBLIr3uWQ=;
 b=AKIjhvEYHNuimlcrA1rwMYTRL4f8GfWX5QPPadIXjycZUmdomXkmibtyW6LzthOCuv8WDXy7gVQVKAo5L30a4wqOUsXBoSJhcsokCMqVfj6TGKf2HVR5Wfvt+j/W+qWA0dRTnICLrTle0L0T4Gx19VCj3TaJ2mCFZtVmtpRkMSyL0BnlnF3dDjJML5ds61MAL8gXbIl6pJTIPF+znPalBBM8DhxQHqOkoaAfZub8usOkMwM9wk37R3scqE0OLj3RkAegBamNynzirTGQmQZvoC3juoWSi0LJKlWwb8j8qWtCdQ0u/QuRxYjltK9MFls6KuutWsD8pcFR1vM+hEPv+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hKBoiq+s/+zz2f2tOfKhftCRfaN0Ib7L8IBLIr3uWQ=;
 b=EBNmZFw1U/A2ex9x10D/9zY7j9gKUw0/kTEPhA1DKUsw3SyZNowb9v1IxqGN6uoPS9acOSQQX9kCTa0TU7GWB1mh0Vq/BZ/V19eImgrBBSs5hDs8JeWTy3IAjrN2y0xr5RBLhz0EoZuUMNXXIeBLmUF6JHDJwmX5ubPrPfX2t44xbj7lo2D9JTXtG2r2jzCuQhO9NLy3K4Xt994AGrTISBUm1BWm95LQvT4Efxz3AqlRbXxGuZ3AaeYFTn6UJ0TtpZIFoCwJHV2N8CsA3lTYqo3rU7YInnLDVwPOweQquksm+Ac/lMerjNIKwLUlZVUqgIU5ZgikRJ2QdlJVOgPrdA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10886.eurprd04.prod.outlook.com (2603:10a6:10:580::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 31 Jul
 2024 12:49:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 12:49:59 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Cristian Marussi <cristian.marussi@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95 SCMI Extension
 protocol
Thread-Topic: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95 SCMI Extension
 protocol
Thread-Index: AQHa2OS7+2aa3wQFTUOvpCXejm2gC7IBNFWAgA+fxyCAAAY6AIAAA6BA
Date: Wed, 31 Jul 2024 12:49:59 +0000
Message-ID:
 <PAXPR04MB84599389611E0E789E425FD588B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
 <20240718-imx95-bbm-misc-v2-v6-1-18f008e16e9d@nxp.com>
 <dee6e871-daa3-4886-be57-e4d4b3fa198d@kernel.org>
 <PAXPR04MB84592DE4592FC5D270F0820B88B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <ZqovdlPcnBbZn0Ue@bogus>
In-Reply-To: <ZqovdlPcnBbZn0Ue@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU4PR04MB10886:EE_
x-ms-office365-filtering-correlation-id: 27e0fbc0-9ee2-43b8-292c-08dcb15f498a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?oYUmjnYJ82aDI0sz0HLbiRN2CCxw1os5jZij9MHtrro28+MnS6EVCMrElmXI?=
 =?us-ascii?Q?2OBzIURQEIhRtNYxXfAXSK6pR661UhovsDf15SpFdJwHwebRgmFNvJ1pa/mv?=
 =?us-ascii?Q?njMIgM10iv4egLRxPpjClSXkkGeZnO9Ddpi6DNdCjXIJKOOeYf3vrEbC6Z7w?=
 =?us-ascii?Q?dOi70XZ/pw42OGTc61VhvBOEhhHFbgCalpS6vUo7rEi8jML21MCsWzptlETY?=
 =?us-ascii?Q?Z/12u0yQqSNvLbYKnUTcOl4Izg3JQrnf69OCKkeo/51Ua8JAbbojGSq4PNAH?=
 =?us-ascii?Q?8Oijf2EWV5zKyneSGomSId3U/kd/I0/lL+ghcfn4gip/NueX8kOr5y11X+7B?=
 =?us-ascii?Q?dEBQsky6RXYZNKMZOYS1W/orVZbXi+zlKPVBcSVZXfiaZMLexFjMJHgJMzb2?=
 =?us-ascii?Q?OM8PCt0md9MEkhAxHfqDPWmagGoaILkj01I+e5HLa/3ADAqHQLN51TiaXoBg?=
 =?us-ascii?Q?rmSAOMfOC2Cvyac9USONmpusI7AfKEwmWr9NAw409PE11h533w7xXYFElKVd?=
 =?us-ascii?Q?gBSZvLfrbYGZvqHtCahpgfO1vSQLhcBjdQyCSN/cJLUXoL4nCdr4uOac8Rd6?=
 =?us-ascii?Q?HkduyHWcldvG0v16bUQgSvNGjFxZrOsoI2xL5KfxKFO+LEW7e6MpZiIzxKb+?=
 =?us-ascii?Q?0RNePirneivZV9KmBfQ+ItM6RfTRIZjvC16V9y5gT8pszPgGJW5HQHdsNbMI?=
 =?us-ascii?Q?vzEJH5Nu84cSiPjjyefBEUd5X+BVRj7swwyorfLkuc3ve96z0Te7e3pl4yrS?=
 =?us-ascii?Q?kN0wHI+O5G75npZRAyBdRF2QRSCZ+W7s4NhGgccKlZ4IhrlI56wdQxEJqYD2?=
 =?us-ascii?Q?B57GfbTjxvmNOioe9sHBe9GbSq7nvvZxYKvGSX8kZxkTfk2nZ5jlfWyje3C1?=
 =?us-ascii?Q?WJkZIaLGphKSmrJArABaB0esFtkTYys01mWOjJAlISiPqfn3Wyh6kbl65NtR?=
 =?us-ascii?Q?n8eeXaR/OZUPj4SZBNzs8pTgpSsP7+19KH78KKxbjAS6LSn4grlHWLXiAGAx?=
 =?us-ascii?Q?o+6d8l2rbALITr4yOGEVgoqkMz9z4UM4y/aS0zgOU0NOhujPd8QmZW3Ow0r1?=
 =?us-ascii?Q?NRkfGX0+ZSM/A9DSCRB/NZ5eKMp6VipASrw6jF4nm3L7LMnI/0gy31EcikT3?=
 =?us-ascii?Q?VHtznZZMApfQmFVspf5p1cxpTvb+5RZZ01JUUCfVwuNbPYOb9EPyFLIX9vd7?=
 =?us-ascii?Q?EUJ6z+QX+MvbbD0ytop7tMtdgrUgl1mb7Y/H2LHUlstcTzHTic1OzjHxnft6?=
 =?us-ascii?Q?eRI02vWZDaowkA2RF3YKmrB+tf9+YyLwgu+3gzk+K9REtBL8OpiDnzSNuA0a?=
 =?us-ascii?Q?e2Lgvs4jPqe6994voR/Xf9BzVLV5DGStQusisiZhRDNU4Rcw5ezxwGQTL9nD?=
 =?us-ascii?Q?m5Lsj8ZoI55H8ByRZfAzQgODM36MDqf4eqxpxN9ZfL6voQT0AA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MIvEe0SylD0cfX3SgMF8iwPS0/A+MXd46lBbAPtX8j799NBdJXtI6aZWx8er?=
 =?us-ascii?Q?Dgl37ZBZXDpM3LKbL7/OY/Q3B9rll8hEb0MH7bPTxQLvZo3vBZnxLan6N78m?=
 =?us-ascii?Q?DTOCH1vFkNkBAe31rygE07HUnWCGPuM0N3HipHuHfm6UuCmgblCS5Rk0SMMk?=
 =?us-ascii?Q?0yN5f3Towu0hYYXoBEXKWZxsCr57GrT6Opuzk1NqGCEFevh9gGCPDSStZGF7?=
 =?us-ascii?Q?0RVgg5ehwT8RQrxd+2Vzx3o27JzV9QSCV52+IrczU4Pc+lQ2SNfvJ6d6ZZxo?=
 =?us-ascii?Q?0oFYWNi06m2uECvCHLxPgOKH2d4u04tOxT6hyCMIDy6kJ5+gos8eWcbI4oyW?=
 =?us-ascii?Q?Y5wnD5cIOcPiGtSHDE7gFzCoocDyhj22sq0Umt6LEGiM6GsLs6DGUZT1z1Qa?=
 =?us-ascii?Q?yFZ1h8H8d4mmKXqAR78LpzCX9TMuaeu5cilfim4IkzAQB6x1cQkO6cn5KWfn?=
 =?us-ascii?Q?O836rhPCAo3um/8OtfCZQA/kKAx+9JeMr9EwEqwlUkyUm1aj7lFJA5Jm+lkW?=
 =?us-ascii?Q?o3f7+kkC451+9UQ9fU5EtpF30GftUDdn8GQNwZPjcaadGok6UQfSwITELx9x?=
 =?us-ascii?Q?jau9Ye4I53djiyHl7SN8FLSzUMNZLzOPA/aFBAwHXC3l/BKxS/LwLcBD2Oou?=
 =?us-ascii?Q?Xt7hSTWM10QMImjv7SH2Z/NHuLSSxx6HwM/OFpXpgbUwA2C7IgPw0Otvqrc5?=
 =?us-ascii?Q?oMpbgNUYDgimt2D2F5PaxIu9HtTp4WkP+ZVcB+9KQJhGMfXstU0hPb/xZpvV?=
 =?us-ascii?Q?lOkgGDH0r4gZvMcjVABI2gZdOX7uA2dT2O8/cSvLOH2PuY2oNXjZShpfJ1oc?=
 =?us-ascii?Q?JYoeZFAOXu6m9WYp5sePQu8Bv+4N/z2AnScsacLx5LrDt7WQfns20LX7eXnr?=
 =?us-ascii?Q?EO+2omXk9sulqzp+6VieqImsm2Zw3V/OoQl8duAymb32OeYrgJKVXB+fmOr2?=
 =?us-ascii?Q?hA+Fovr1IXrtu8XW2Wq4K+PBaJZzX/6XW3PBlC60F6McxhMH9Z2xBfNLMEWc?=
 =?us-ascii?Q?n8rn9WCJCQZkoT+TyAGn2XEZnYF2mVcVJ1V6MaUuDoVt65EOBE0jj+HPjqeV?=
 =?us-ascii?Q?WIC6LFiQk6SR8N/4pqGwutvFSWc8eNwAugazdW6PkreBq+y2ZO7diIqHyX6t?=
 =?us-ascii?Q?N7o46jiHZSCkGaaGBC4ZTkofhFH+xhQdZoIyWxiCFQlRlqkH1mmkaL5AmT8I?=
 =?us-ascii?Q?KXcwDuKIH/GQQQHfz4yLCbiojFkg2rXmx4wiobB6gbg9Q0uU9hM55/jfSalW?=
 =?us-ascii?Q?jHxN3qTDJEucag1SQ1U0DGeTqQcRFAceZYND4/SwbApSoHzHUXXwuWzpGnSs?=
 =?us-ascii?Q?mPW5AKpPB7VGKzvkQWqpOH7WVwOfhUPzSNY006+hNfkMA9G3QKiNaALyUi5J?=
 =?us-ascii?Q?kwDm55Ntx4kS6S1rRhfWTZr2gK1A5AfHWcJCIf7VHhus4UmvYIOMXUYqgjLO?=
 =?us-ascii?Q?CYtj2hDf9IOfuGV3WhTq/W9+DRUx/qPialPjg9t6lpSo4TXvDGka4FbIvnMD?=
 =?us-ascii?Q?VUqug1aO30o6GSSVtTtIVtI6Xs+nxNaHSPAGN95xvqpbxxWvpY5F3IQdpTsu?=
 =?us-ascii?Q?7dnlKzWhBmfhWqGubi8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e0fbc0-9ee2-43b8-292c-08dcb15f498a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 12:49:59.3473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MT/dXi0hbiqcy1fK+YRjBvKoEZqLghUEycGTpb1vvFzr6oU5K4CX5IWXxmJ2A0FBRETCozTDactjmLKNbwgg9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10886

> Subject: Re: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95 SCMI
> Extension protocol
>=20
> On Wed, Jul 31, 2024 at 12:18:28PM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95
> SCMI
> > > Extension protocol
> > >
> > > On 18/07/2024 09:41, Peng Fan (OSS) wrote:
> > > > From: Peng Fan <peng.fan@nxp.com>
> > > >
> > > > Add i.MX SCMI Extension protocols bindings for:
> > > > - Battery Backed Module(BBM) Protocol
> > > >   This contains persistent storage (GPR), an RTC, and the ON/OFF
> > > button.
> > > >   The protocol can also provide access to similar functions
> > > implemented via
> > > >   external board components.
> > > > - MISC Protocol.
> > > >   This includes controls that are misc settings/actions that must
> > > > be
> > > exposed
> > > >   from the SM to agents. They are device specific and are usually
> > > define to
> > > >   access bit fields in various mix block control modules,
> > > > IOMUX_GPR,
> > > and
> > > >   other GPR/CSR owned by the SM.
> > > >
> > > > Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> > >
> > > Why quotes? Which tools did you use?
> >
> > I could not recall why have this. I will drop and resend the patchset.
> >
>=20
> Resend only if you have any other comments addressed, no spin just
> for this one please.

Sorry, I pushed the button too quick to send out v7(just correct=20
this R-b tag and rebased to linux-next) before checking my inbox.

Regards,
Peng.

>=20
> --
> Regards,
> Sudeep

