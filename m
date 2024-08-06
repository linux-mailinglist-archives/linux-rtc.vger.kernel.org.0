Return-Path: <linux-rtc+bounces-1665-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C63CD949299
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Aug 2024 16:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C6C6287CA1
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Aug 2024 14:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DD518D62D;
	Tue,  6 Aug 2024 14:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="T1JEQkdW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2067.outbound.protection.outlook.com [40.107.241.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9955F18D622;
	Tue,  6 Aug 2024 14:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722953087; cv=fail; b=VyfIsl4CMzD209Of3oMyop48uWmjBvJzEZ2SrCz+8PubtDa7s88josPYhPpNefgIV+vZbpgqCFNupO3xnPa7kXGx9JI/CYqTgjHWSWtin80bebwiII8VWPRi+LGw15Z0uVS9yJMvD9rzlgRG6+7omQb1MtPRdma6ext4tnCuGOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722953087; c=relaxed/simple;
	bh=zs/2oJtYDpsD49zBm2iFOROBX8Ml5zGFsF2oeg58MS8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B8FudfJkm/3Gt01z9QVfJp5gtjyo/c/KsdhOqD9AeDr1TZGww9BC5q42DSu/BPy8onuE8tCohG0wSxCRwkRSelNm2L2qip9Be3ewAdRuSAvb9SBiYCp9hzFsSzTxgFHWkZZe3/s1lkqPKCBOqezY4H1Wb0Qnb0bKMNqsRYYAKxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=T1JEQkdW; arc=fail smtp.client-ip=40.107.241.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLShbJDmwPl/7MnroYknV8zq+ee2TFfKh3G3MxsblXwxq+5qawqXzphOC6rKFRgMNpTj8Q14uPjdC50VoHtpm6nFg+ojNxB0farbOrEWLyaaEYE+T6twt/EW7jEQv8e8l2M+vOzwfKqIcX/6n1TGWopaC1bHcGlGeJSUJ6+fbJWJKOQnobDGm61iAA+VFdIWfYsotdwuvihDRdiMCal1Rf5dPsISHVWP2c3jwCxEbxUFPpTUmD4HgQ+JAHg8tN3cItHhdoG8216XNJZSyEf/2dWxlRfjo1Hzy2AF1Z7jyBOOkFnsf0Y8eS8RvhracLIL7HRt/kNzVEEWgoX07UZ7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvRrNORbuRO5oRDWua1+C+WUUqCQie7Uq+FMAjAW3Fs=;
 b=r2Ak4RkBQ9d/T8nGEUPQFDQ3EiU0yhjVXtzLO0g5ecGdffvxtIFurFyFjz7VLSP4SsCRJCraZCugPC1JigNEMOAdKXJX13izw9e8ONNuIlAdIOfjylxvkE5nojCnCAcJgi97T5WGIdS7ij488AAnZ4WaHI3ecv9Z3w8Jras6njFWNYLwOj+DWKxFrDd4IyP6NySLqUJj/7qCxONK2ggOLfJXOT1NrKB+Em9XGqI3yNXxONYC+1MnvQEBSe9XQVdhCH115A54kFhSgugI+oe0k+mtT1z7nFlVbm7mmh6LG+l7d2z7vRc962NMtyOcRGAi3iCogyTgo7md8hxfldjgvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvRrNORbuRO5oRDWua1+C+WUUqCQie7Uq+FMAjAW3Fs=;
 b=T1JEQkdWvqwy9AZS3RA0YUO8qt7/6hdMeCi18Zr/YCE+Rb6UkUO5Sii1aDYZCjqAeGPGhOUhd+6J7tqb3e8Stzdinf32Qn8xDd+LPC0HIP9SO018qB++40gYGsy/Vx+kHg09LWz8KRVlg7ndkYct7+DxW0mXlXtc5Kk+BQVQ/ObBwhySud5uuNZYE4HGlvIdPtp6ree5UnTxGxdzWx3B3Qv8kuDKzdTDmLQEbipUCy5nIrtWadkDTAuZVCa5FhyRUYyql609hqZfb2MxRMp/JnNzhzApyk4wljqaE4GfUpTeg6w14KkNA2JcFYDAENkO9alNJAP2efv8HXQjRY0Hdw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 14:04:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Tue, 6 Aug 2024
 14:04:40 +0000
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
Thread-Index:
 AQHa2OS7+2aa3wQFTUOvpCXejm2gC7IBNFWAgA+fxyCAAAY6AIAAA6BAgAADAgCACXu3AA==
Date: Tue, 6 Aug 2024 14:04:40 +0000
Message-ID:
 <PAXPR04MB8459EED70507C786150B9EF988BF2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
 <20240718-imx95-bbm-misc-v2-v6-1-18f008e16e9d@nxp.com>
 <dee6e871-daa3-4886-be57-e4d4b3fa198d@kernel.org>
 <PAXPR04MB84592DE4592FC5D270F0820B88B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <ZqovdlPcnBbZn0Ue@bogus>
 <PAXPR04MB84599389611E0E789E425FD588B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Zqo1BpZ9i3LC_TIQ@bogus>
In-Reply-To: <Zqo1BpZ9i3LC_TIQ@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB9927:EE_
x-ms-office365-filtering-correlation-id: 5b8415da-0579-4aa6-cee9-08dcb620b6c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?r8jNM6fejt0Lde4cVIFiXvfwh5mBoGMaqiwH6PbJhj3EoYw2vz5o7BVLg+Pi?=
 =?us-ascii?Q?PwmhG24/W5h7NOdfrmFHa7S98k6EYM97qokbFMeewIrRCBjRt4ZP/uSI3iqV?=
 =?us-ascii?Q?HdehPS9mM2QchVALYshYNbgorKI6+Z8Vj88oNUmQUGt+XjtGAJ9Cq9DG+2l9?=
 =?us-ascii?Q?FPEIrZwAnRH6VCKN4UMGtWrB+8bL2B5E1Aosv8Li3Nk8XrPshII9NiSk/epZ?=
 =?us-ascii?Q?pJ/ImpLBkAb+OtEAh0lxE+v9sQc5Y/PnCO8eR4DVuBNgcoJOxjhC1kbvvM0r?=
 =?us-ascii?Q?XkYAfvcUVXGPSoRoAs0WsTCZ0JoABH0HNZdP66NMM6DArU68f8r9JO8oSjJN?=
 =?us-ascii?Q?9uNA4w51AjzDNFGXziqRSwLnwwaTir1//WbLaMGcI8J/Jdvm9phDeL5nuhcu?=
 =?us-ascii?Q?eswbuWC/pmU+DAF/pvJUMAraxDyc4weynjky366Rfb3LPCeSIe79WLWDaOju?=
 =?us-ascii?Q?8Sr717aeE02HqNontevZvcoGmaZ4J3M+ZUEFceSKCzjQxx2tFuAvvDCnsJBj?=
 =?us-ascii?Q?6599HZYcd4J4WBzfPIOSiyL9WNm3O8DM5lcGOTn2y6lY5fDKieGClLFFgRJ+?=
 =?us-ascii?Q?oD/Y904QfnZXEft3Vq/3fcDcKxpLj28dsl51hnuGnrB1hme8Q2CCg/UAVdWW?=
 =?us-ascii?Q?senfKNlZspN1dj5mshBdkp67QK0gTRRF/mXmSMIYGVIpgOz9eX3Szm+MVy6h?=
 =?us-ascii?Q?zGyR4n7tOpt5TnF8CWpPahbYLAa2iURn0SAEHAtaJUqOHYEJLettEX6OANIC?=
 =?us-ascii?Q?CwV0Vsgx2OyRuucjCrF1s3AM838n7rPxZaDaJ3NH3Zwan/iG+MefoY3BsDaw?=
 =?us-ascii?Q?CVRUejJkoOZ3nRgpzch+HZxg3yiHq5rGyQOZuaQ2S/peSL5jv1jx/HMlc/Vp?=
 =?us-ascii?Q?v2EkC85nmGsHED/cb+lnystGylfgYuL79yroVRLdqeeeTCnXQjL1WW39354x?=
 =?us-ascii?Q?3id61E9FqCugTSsuuKjkMLwQfAy8eI0l/sN8NIaEwoz1k5UinIBBagG17UQ2?=
 =?us-ascii?Q?5dc92IJZkKbQLKBSrfl3mUasSna9biGuOKQFjBbMvTXsX0xy/cHjD6Rlrt6K?=
 =?us-ascii?Q?NX64UTXOlNc505GHXnhnzG1HMP7IFMW529tGfPFXxb8WwQEI5kFr17Mfx+ic?=
 =?us-ascii?Q?PSaMAJKqji6Eptc+3im9OxAJmLBCAiXRAII/GHSwuJGBt0SNDNKn02TVGSNq?=
 =?us-ascii?Q?Ur5w8D+Cb/dNoKWIn4vBwGNb08srMfPsxYCTh5HL2rt8bWlsHmfSyI8Usv7S?=
 =?us-ascii?Q?2KbbyAHKVNipo6S2Tohr+aij/dpDN1g2T8j3CXmkRkakU9El3kdO7DJR/fDz?=
 =?us-ascii?Q?w5eMQYJ3IVI0RsZbHM4ZBIlJAfjfcqxjUZAlIAvhuMVTlFLs8OoqLHpOF4rD?=
 =?us-ascii?Q?c/po5cw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?byDIJCAmJ6tbG9Qf8mqemOzzc3hRmhb3XnZ1VwByOy+suSSLGYx4QnlWxb0M?=
 =?us-ascii?Q?qYVEVl88w6zIaprrtr+946TshUwF8WycVmNlayJZEsOSabzSTrkYlPMC7Y2i?=
 =?us-ascii?Q?VM4mGa9vth45ZjF1fzAbDHNZYr6ip0ZWzw0phwcGK1SDHSgHWCqfMgHYwFJ1?=
 =?us-ascii?Q?wLHRJ7s2eUR+e3yRuqpQ6cjxRQGiAasgi/4c+iK/nzggbrmVh6Ma5tAvoqTk?=
 =?us-ascii?Q?CN1r9H3hq3xo4sd1B0O2+o9KB2MYa7LYGrMIU4OhoIpw9xiS+yo9fNxkB6Md?=
 =?us-ascii?Q?/RqFcaikY70yJ6Wd4szY+Q5+uxFMOaTsod3N4dTDuaV7TnmQ0T+MU2NNWHEM?=
 =?us-ascii?Q?DsGnGsTDhrLTrh0s13OQJj6R1DymV3iSzI35BroD0fHdO6JJ96RUaqvGWWCm?=
 =?us-ascii?Q?p579ms7FRsxvWmNyjRGhYqfXgaN7RFmfNWhSLLM1wrbYNUjiLpk0Jr7V3tFd?=
 =?us-ascii?Q?b1FWRoVqt0GxUZTlC2b8CTWv2OBmDiV+mo52SbrHyHD8C1ULE7Fj6FZ++9UL?=
 =?us-ascii?Q?teyN1OMQlVnuxlyX37wWHG/2kG9HQpOEmM21Tdo07r3G18kdGedKA/J1sUb8?=
 =?us-ascii?Q?/7JWnKEInsfJVsvd0HFn2NXZnlEtr0cjUN6Bo7YL+k16cST8/GUn+sclmzxy?=
 =?us-ascii?Q?gocEzPgz629tuHX0gavsouEPF/MiMg+SIXIJBnucKINIzhwmKqtVLM6JUJe+?=
 =?us-ascii?Q?AqoF0YpJI2TK3R5nNS8DgoXXzKBxn4iLYOSjuyDlf/z++bLiT5wXZNZRy08H?=
 =?us-ascii?Q?A6XhMtGcYnfgyIVnoZCt6ek+zQGUr1g375H5KjNis4Hcyaegtw8BIMqFVF5h?=
 =?us-ascii?Q?09pyxJAUr9q8McITJ84jBSvEntzTA0ND7VPH+UbB8OxDyDFV+YMcYO3lTI+0?=
 =?us-ascii?Q?869YSN36L82InyCwKi5wzJl3xJ1fSjOCGAukjiMimvAu+CSlqLSGfLvufMgQ?=
 =?us-ascii?Q?lk+z1dfY6evMbyNLQK6hpYOXohmYaY/6D8SqERNX1/Ii1Sax4c5zmERmcF7d?=
 =?us-ascii?Q?/v0h75tXECW2cUfzptYnVRABgHNRHqobeP3xSJTP9gUbogeFE2fi8yU1n05r?=
 =?us-ascii?Q?SMeUmqEwiE7cLEliD7YSzVPZ0hgyQQYq/9Wt+WG9IFekvAcbwQ0N+sIIoscl?=
 =?us-ascii?Q?Wnl2U4Qnj5RpHxkoZG5J3okuRuTdKp8LmlJ22vIlRMjpUl1MatfCd9yURKfd?=
 =?us-ascii?Q?QtpNccAoi8Y0DSRcLWQv4X9xvI+sU7XnS7q3BtcCHHeUAm7CEzNHeTjG3ATE?=
 =?us-ascii?Q?cUb5xhgTBblmjMPIDZoODOVRhpIuAhH6KQXEUj9uMJHra23f7MUfyznNYnv3?=
 =?us-ascii?Q?ZvOKf3xrc6soCYydJW+OiSGkHl1VTPQL0R8SDtwiTc2YVwEEmU7Ox6dIjukF?=
 =?us-ascii?Q?REoE4GE44rEL9Zpl/+YU0/JBL1qNJ/Tg/QDYAehcnyjJk5y4CkDie463f6B7?=
 =?us-ascii?Q?oadyBWy515WPPYjJjOjum1a76JByghCPapWE36kqvqw40o10rZlns+HmmtLR?=
 =?us-ascii?Q?EA41lQoKHFKoopFb2vL1UsBXVmEeS0gNRShwvVulfw/ocLu5XtHX3o1rqYTK?=
 =?us-ascii?Q?IMyih/e6qk1jvoFNTcI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8415da-0579-4aa6-cee9-08dcb620b6c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 14:04:40.0989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wc3/QiC2FPo7tn7P2OUwpidvfTO2BQF3RoPb2Q9yAIMH81z0c+kGhkq/qgl7PhcLErFNFI4Qu94QoDsp7mKAPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927

> Subject: Re: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95 SCMI
> Extension protocol
>=20
> On Wed, Jul 31, 2024 at 12:49:59PM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95
> SCMI
> > > Extension protocol
> > >
> > > On Wed, Jul 31, 2024 at 12:18:28PM +0000, Peng Fan wrote:
> > > > > Subject: Re: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95
> > > SCMI
> > > > > Extension protocol
> > > > >
> > > > > On 18/07/2024 09:41, Peng Fan (OSS) wrote:
> > > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > > >
> > > > > > Add i.MX SCMI Extension protocols bindings for:
> > > > > > - Battery Backed Module(BBM) Protocol
> > > > > >   This contains persistent storage (GPR), an RTC, and the
> > > > > > ON/OFF
> > > > > button.
> > > > > >   The protocol can also provide access to similar functions
> > > > > implemented via
> > > > > >   external board components.
> > > > > > - MISC Protocol.
> > > > > >   This includes controls that are misc settings/actions that
> > > > > > must be
> > > > > exposed
> > > > > >   from the SM to agents. They are device specific and are
> > > > > > usually
> > > > > define to
> > > > > >   access bit fields in various mix block control modules,
> > > > > > IOMUX_GPR,
> > > > > and
> > > > > >   other GPR/CSR owned by the SM.
> > > > > >
> > > > > > Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> > > > >
> > > > > Why quotes? Which tools did you use?
> > > >
> > > > I could not recall why have this. I will drop and resend the
> patchset.
> > > >
> > >
> > > Resend only if you have any other comments addressed, no spin
> just
> > > for this one please.
> >
> > Sorry, I pushed the button too quick to send out v7(just correct this
> > R-b tag and rebased to linux-next) before checking my inbox.
> >
>=20

I just rechecked the whole series patch version history from the
cover-letter. And I have to respond again to your reply.

> Just makes me wonder if I should wait for 3-4 pings + 2-3 weeks after
> the last version of any of your patch set without any version bump
> before I can look at it.=20

I hope not. I think I not did rapid version respin.

Otherwise it is quite impossible to match your
> speed of patch respinning and the whole review process gets
> complicated to follow.

I'd argue for this.

If you have read the cover-letter.
https://lore.kernel.org/all/20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nx=
p.com/

The patch version timeline is as below:
v1: 2024-2-2
v2: 2024-4-5
v3: 2024-4-12
v4: 2024-5-24
v5: 2024-6-21
v6: 2024-7-18
v7: 2024-7-31

v2->v3 is 1 week, I admit this is short period.

as you said, you not look into this patchset. It is almost 6 months, I not =
think
it is a rapid patch version respin except that I did a quick update in v7 w=
ith
just a minor R-b tag update after I reply in .

>=20
> Also it is bit sad that you thought it needs to be re-spinned just for th=
is
> which can be easily fixed when applying.=20

I admit it is not good to just update R-b with a new version. But..=20

Also I haven't even started
> looking at this series for the reason I mentioned above.
>=20

It is 6 months.. if just because I missed your 20mins reply, you think
the whole patchset should be delayed or else, that is not fair,
there must be some misunderstanding here.

Thanks,
Peng.

> --
> Regards,
> Sudeep

