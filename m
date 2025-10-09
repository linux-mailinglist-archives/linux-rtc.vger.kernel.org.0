Return-Path: <linux-rtc+bounces-5076-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A8CBC7F5F
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Oct 2025 10:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F3BD189FE46
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Oct 2025 08:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5500A26B97E;
	Thu,  9 Oct 2025 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Pe9W6XaR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5472729D292;
	Thu,  9 Oct 2025 08:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759997636; cv=fail; b=M3j+/sq8KOI1wGYGSUyEw/IUZ7Yg+jJUT6MGsOlG7Amefn2PD3pCRjmG3Abe6d8CHB+EYVbfP4YA2eVrTXWqoLKCdMLCncnLUovvXckoKdlRCD2cXBddaG9RKkwDhOKyNectdw1pIVIRyI2HEUjCTj+rKfNaErwk6Y+MlB+u7X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759997636; c=relaxed/simple;
	bh=pTtw+9j8r6w3YA9+mBR5AKHTAIAg1Kdn5mGN0rmiOc0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tsy4wbpm5qaDeAJVFDtjdKHxRyKztlQYxgCPmnBnu89AEBUYYweE/LmbTs3GmMeuNkdQtf33kl3a7aWGfZEQJCgu9uh1ms3Cq69L98SXUyjWrsr0ElFy7VOTpVgRCs2LH0JbRuA80KR3knoQkdZwQEB+yUp6i/2AsVhiwN8cVWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Pe9W6XaR; arc=fail smtp.client-ip=52.101.83.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNFM3KEurfGRSbEKE5BKZ2HR08TmikKVg3HRjsQN5SG5TdlL4++qjckXGr4c2Om2GbkJE9/CyMAR9pSDO7mOfuwcCG/NT6pUK0wbgEQsECaKut0P2JGC9/YwJH+DIVFXO9BrWQ42Q+650m/pDaZwq+CP8x2o0bTKDtRWFHti8sD5d5Fg9FMK1SoNXjUgXpfh+Sn9Q7CeA2dkk8H6Z0/xZ5NYtc32eV2MUNjkDG6c73o6jDAf8n7Tmj3BnXlbFhyX0RyXk/bifuGGc4VhBeFW4Xp27FtQ46yYWMOfmbQXu3Pp9RsWiBXWfPuvwgMvpBYUPUf95Ij5yrh+R8hWSwITqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfbzS2X1nw+QhpnLzEbGhXB7TmZKD0Gh4bW25b0Rlp0=;
 b=rY6ew29WMcmLHkB+ci65rBo7QDzQCUmndEAp647IoOEJBAT+N3tCOsQXM+6gD+lz/0EkrSKZu6FdZBQwh0a06e17rnNAen4mRMdxFzaTSZSM9w+X/WU74F06o1OKtcOdFJfmfpQukgu/DFJEFf1Mwd+NEiVyzcnOvemo4R0a3RTbBUxbOWgmQHIXQHSgav7XpJtvvKlMWjoG3zuxB+ajnUSA3LqOp8anZKc5CaNLjFS1OEIRApYClnFxTkKaKuV+x5hAZbKie+rFqqVpmTtU8cxI6euwtxzW9qU+aX4ZGdlETkDTJljzXjA33P20AQy0uZmbKVqxbDXj7Ixl0f3s5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfbzS2X1nw+QhpnLzEbGhXB7TmZKD0Gh4bW25b0Rlp0=;
 b=Pe9W6XaRfmoWIL/kW6kwmwo8qxyyI3f2HhHjN/kfXwwXgS9Qr84Oqn1w+4AviJBwoWtPjEIlPTmyt7t8tCoMeQoXX5r100DtJ44DJlOJF9SBqh7il+aUL6uFwkYWfz2gcsECID6Lr3qRJRSjC1G94ZH9a8tINVnvA06SAZdtRjWHxfiQlS2z6DjDh3JsWzCYuXh+Xz0T0xgF23bkPxuex1BQwaUg3LXRJQQQil3kCv75Hl8yztWS4ARL6AwyDJui7UZDkgSKa7P02XtLriu+FUa/WynVTHWKUfunvnqAKHiXpFONaU3PjrS5IQdyoabIF6AMd++1cR+ntxihZDilxQ==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by AS8PR04MB8660.eurprd04.prod.outlook.com (2603:10a6:20b:42b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 08:13:49 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::e196:11a8:211:feaa]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::e196:11a8:211:feaa%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 08:13:49 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Conor Dooley <conor@kernel.org>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pankit Garg
	<pankit.garg@nxp.com>, Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Shashank Rebbapragada
	<shashank.rebbapragada@nxp.com>
Subject: RE: [EXT] Re: [PATCH v4 1/2] dt-bindings: rtc: Add pcf85053 support
Thread-Topic: [EXT] Re: [PATCH v4 1/2] dt-bindings: rtc: Add pcf85053 support
Thread-Index: AQHcLH4RzEHMxRHWdEG2vrVmdCJ3xrShHtsAgBhv9oA=
Date: Thu, 9 Oct 2025 08:13:49 +0000
Message-ID:
 <AS4PR04MB93620F7CAD21F745B95FAF1CFBEEA@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20250923113441.555284-1-lakshay.piplani@nxp.com>
 <20250923-capitol-easter-d0154d967522@spud>
In-Reply-To: <20250923-capitol-easter-d0154d967522@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|AS8PR04MB8660:EE_
x-ms-office365-filtering-correlation-id: c217e932-2ad1-4da9-5464-08de070bc6e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?s81LW6t1x1zZmlRhcTbKvQewUIlDi/BcRn9M13iaMkl/p7bwkxfI0LEKCM?=
 =?iso-8859-1?Q?ongEELD5r8eQto4TlVFOZB7EvWUm4jAxz229ZGgOTX+I2tYJj7u/bXM/wk?=
 =?iso-8859-1?Q?M1umZsw/BAZO90rIl0/Swn0ARk0SdOgjxG/K+Le/8SpGaV7oHRib467IE0?=
 =?iso-8859-1?Q?QT/0hKQUMQSpT5IHfgRvwE/yUv7HVUSTC2o6so6cro6dg9Ogaebj1CKT4W?=
 =?iso-8859-1?Q?HVI8zTLv/hHaMEdMKjiEJ/PFV71xvEBnYu2guT3Jm53iwOUCI5QMDV13c5?=
 =?iso-8859-1?Q?AhqZbwYaUtNBCesxg5xi/UhgGxw+Deybu+dt7Yp8qrPlZ1CNZ0ciQL55Qh?=
 =?iso-8859-1?Q?RiP4IhurcKMkCOcCWEkK2rvA3+EbSflIrru3+HG2dCJwYOOlxXvmzhwkli?=
 =?iso-8859-1?Q?b3sWgdmK0dwikVWQZ4d9s1C4bRxffZZw7iQqcRmcF3u6ZYksxFjSC67T/0?=
 =?iso-8859-1?Q?EgfXMJooeVjE0xxsRP6REPs9mvKu5ShFNRXLZ5gIpZf/SKTIF4r41DGbJz?=
 =?iso-8859-1?Q?QudxmQ38qcMsgAzjnyXzqD6dDKtMK28XwE9LR+HrJfkdMxERGpKQNx/fY5?=
 =?iso-8859-1?Q?ehu1p6rNQu8n6dZhe94aBH1BqWbgLTDuQTzgVzfRyoMcy7SGk7q3nlgo7C?=
 =?iso-8859-1?Q?C/Sgz1KLA4YCSJNSls6D6D3HoL0bVJ/iQay8icRHFiLWQnJDyU0hIPcSNG?=
 =?iso-8859-1?Q?n75pv7Pf7Z0pTK6+zPjoQqxf3LYf1DRMj2hjepRJzh1bVeyHLY2amqdrsZ?=
 =?iso-8859-1?Q?YNeLah6L3V0ihQmRMHdxo1jd0VI47oIOHqAoNTBwa1TVPV6P2+3aPltUkX?=
 =?iso-8859-1?Q?OmHTnvt9U47es5k6O8vC52GnrwTzF7zCS2A7ADMt2P8nBAImec4CnfGU/i?=
 =?iso-8859-1?Q?cmDiclJe6ZR0Xiyl4ThYf2qtHulFnArCpGkPgTiyqL7gsAOEsFNeXWQDfl?=
 =?iso-8859-1?Q?oAwWCd9BEJyioJLc/dCNbC8CeJjKCwLCdinIOE/U31H19c7iEki7Xp34ev?=
 =?iso-8859-1?Q?+fcdvoewmpNypyvD7qtwpZnYHQUxi9At3ptv0ua8uaJCVgvw0JMJePm/Em?=
 =?iso-8859-1?Q?jrvtVfXd9xLbOYfz38tCmVJvpIloHmnEZ9q+Pgg79sfjL/CaFFOf/DzUvm?=
 =?iso-8859-1?Q?hq/V0lbhANLqOMkrpUTfwNNAV/fqbc1HDE2rh1aiXuf6S3oLoYDnU4KtGD?=
 =?iso-8859-1?Q?FBOPQQMuptweuUOJjlzZmwE1JNHf9TDj+52rtJ+zBIg1dVNFWbVxv/KrmH?=
 =?iso-8859-1?Q?OGL9P0B3uJdKYf3s9vBrInc93QKVcvFq11HbVCxq/D+7cORTGXYaexWtXl?=
 =?iso-8859-1?Q?4zogBi4L1ZmeEKEcQs1og61vhxvI5L6MJ9H0tJcmPRnXe4u4JKNN1wSU/M?=
 =?iso-8859-1?Q?oHcF94neS73DI/JiJG029PfRbELxZmQCWySCnXT8YFaXjPT0z67rjbeEmu?=
 =?iso-8859-1?Q?VveHXMS2d2nR7aUwLJk2yc5/2nx0/6jNaGMSQzn03yvybc8IO64xK6vKjL?=
 =?iso-8859-1?Q?1UPATdioII3aYYZe9Eu0k68FvAAsbf9r6BeO7LqD6UpA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YbyvLpT2r7EgL8pamqts1FGJJMgIrH1U8+oZtuoZNeCwRMhL70HU+aMtJg?=
 =?iso-8859-1?Q?CrJ4ShTUMKXjRbkr6gqBlr9IcffB7yduSQz7jXRWgfV7nC53dfWqBajyfM?=
 =?iso-8859-1?Q?VIdbtBLaoFnGz62b9UJay10XzsGcyG5qnSAfP3Tv3Sjvb7VKnM2wVCpWDh?=
 =?iso-8859-1?Q?9CV8Ldd/4A4JbWuX99RIWlNdC+ekOhiZy+293XvnDmw32hY2Yx7kSNq3Xg?=
 =?iso-8859-1?Q?feMI4nuHEm5BODptLKaejp/IJmf7juhHE2I+elQgBZig60SQe3fnpi/AwM?=
 =?iso-8859-1?Q?46cCwiV7zUDUuQpteZwanwed2NKAiHUwpYaJ923xvE5wT+cxXLP1NvCF8y?=
 =?iso-8859-1?Q?av3VUmVEl3e7dzpAOhMkpxO+X3o/ZJND40SPNt0JvdxcXOyXbqzFfaYskB?=
 =?iso-8859-1?Q?th3q/RkZBorqIFmYuW2jhZk0QdZPG1G7PDGFI/apQwQNwq531bTI9sMzxW?=
 =?iso-8859-1?Q?QlWsMjewmU2KK8t39Q/BijhYWJNfViluL8s7W9WpM5dbUjR9TnTiT5nrne?=
 =?iso-8859-1?Q?OIvpbefM19gI2XiuvBeE+3Iy+hNvppD57Ard58WzbwWnaZnzkjo6hWq1ZQ?=
 =?iso-8859-1?Q?DNgozSJzghuMaOMoAEq7S2vOae+EnlzvRx4h6iF5ZPPFNvcXg/uXROlRc8?=
 =?iso-8859-1?Q?5b9jK6vkhTF8He2yjy59RJyrg4bjAlC44wKZ0UG0Eg0blLq5knjTMELsok?=
 =?iso-8859-1?Q?81VOhhJa16RbIXjKXJPhYrvgj0LKPpBrxqEUMAhLnuOvvkEaou/2EngfEh?=
 =?iso-8859-1?Q?tTG7ewgK75/dbJMRTa/7CR18HlbnOeY2pgkEM+UzsOJle+EUCfSUCkT7IP?=
 =?iso-8859-1?Q?GeKhz7crgp93Bqp/N6OrD0nVmvEjZRFNWrGWwfvnO8YPcSg2gsjZjPTLxO?=
 =?iso-8859-1?Q?JblkgktesWbB5Z4kLgdAhQP+beJDj5xXXDEfCUzSBtAlv0/HdW6JWaHp3w?=
 =?iso-8859-1?Q?87btVisC3VpwhDaGlbq7KwnW9DL21x5/IrouMwsP9/X3GcflrSX+htU8Wa?=
 =?iso-8859-1?Q?Rvraf5VpTjjPkC0PqTrAmj0rbhV0o4kRgs7ANjvrfM2+rUQS7cBX5r0aMB?=
 =?iso-8859-1?Q?G40OEmg34yLeGxFZe457Uwg5LcrFjbYRx3VhG4FkgAGDnBdW8NHoY1Q0BG?=
 =?iso-8859-1?Q?R9j8VgvHW6F8siflgTw6J5fGAMVz/lNnV+sIYw3MTPuffpu1UvnTOE/XH7?=
 =?iso-8859-1?Q?UxyKhjLcZGaNdKO6xRFnz/d9wsShy8OBz6uCs1LRsM8gU/vdTwxWwnSfIr?=
 =?iso-8859-1?Q?F/hBgrSrWpiCsPbXQoPU8SyD283739e0fxtNcQwifs+HeF/vWDfZp9kAUM?=
 =?iso-8859-1?Q?nOYK7jOlEWMAIAVHRQ0SzRCmNdQjR/nCS1oK+Q3zCXt2f86SE8gr1CYSSz?=
 =?iso-8859-1?Q?cyFbPmUj4dFzT/U9+UmMhRvZ774tiYwkZJnKEgB0WWzGu65G/BMWSrlTE5?=
 =?iso-8859-1?Q?yHvNzbsYmv6vqU5dd65XU16k92xI5YxrM43mij2OltpgWuNgFNXbt7F/I5?=
 =?iso-8859-1?Q?MewB97cnMotyPKBOb7+giYmosGJ9II5IHaMF+OblVOA9q1O5S3//l/m8Nw?=
 =?iso-8859-1?Q?uqSvdeogV6vtT7P9efcjKVFRqy6Z6noNPFR0kjUpFsjE3QnOuvJD7P1lvJ?=
 =?iso-8859-1?Q?A2l4VWtLNaQMuyXB2n5l50R95fmXOD5jTR?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c217e932-2ad1-4da9-5464-08de070bc6e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 08:13:49.5685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r8NO01zahcqpW443zFnyn/CaRwK2PCZv3/kygKixtseXGI+gn16CjCZAnklQ4FEybwYEYnt1hU5/lS/OZfHaSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8660


> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, September 24, 2025 12:28 AM
> To: Lakshay Piplani <lakshay.piplani@nxp.com>
> Cc: alexandre.belloni@bootlin.com; linux-rtc@vger.kernel.org; linux-
> kernel@vger.kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; devicetree@vger.kernel.org; Pankit Garg
> <pankit.garg@nxp.com>; Vikash Bansal <vikash.bansal@nxp.com>; Priyanka
> Jain <priyanka.jain@nxp.com>; Shashank Rebbapragada
> <shashank.rebbapragada@nxp.com>
> Subject: [EXT] Re: [PATCH v4 1/2] dt-bindings: rtc: Add pcf85053 support
>=20
> On Tue, Sep 23, 2025 at 05:04:40PM +0530, Lakshay Piplani wrote:
> > Add device tree bindings for NXP PCF85053 RTC chip.
> >
> > Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> > Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> > ---
> > V3 -> V4: Add dedicated nxp,pcf85053.yaml.
> >           Remove entry from trivial-rtc.yaml.
> > V2 -> V3: Moved MAINTAINERS file changes to the driver patch
> > V1 -> V2: Handled dt-bindings by trivial-rtc.yaml
> >
> >  .../devicetree/bindings/rtc/nxp,pcf85053.yaml | 128
> > ++++++++++++++++++
> >  1 file changed, 128 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> > b/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> > new file mode 100644
> > index 000000000000..6b1c97358486
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> > @@ -0,0 +1,128 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) # Copyright
> > +2025 NXP %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/nxp,pcf85053.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP PCF85053 Real Time Clock
> > +
> > +maintainers:
> > +  - Pankit Garg <pankit.garg@nxp.com>
> > +  - Lakshay Piplani <lakshay.piplani@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nxp,pcf85053
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  nxp,interface:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    enum: [ primary, secondary ]
> > +    description: |
> > +      Identifies this host's logical role in a multi-host topology for=
 the
> > +      PCF85053 RTC. The device exposes a "TWO" ownership bit in the CT=
RL
> > +      register that gates which host may write time/alarm registers.
> > +        - "primary": Designated host that *may* claim write ownership =
(set
> > +          CTRL.TWO=3D1) **if** write-access is explicitly requested.
> > +        - "secondary": Peer host that writes only when CTRL.TWO=3D0 (d=
efault).
> > +
> > +  nxp,write-access:
> > +    type: boolean
> > +    description: |
> > +      Request the driver to claim write ownership at probe time by set=
ting
> > +      CTRL.TWO=3D1. This property is only valid when nxp,interface=3D"=
primary".
> > +      The driver will not modify any other CTRL bits (HF/DM/etc.) and =
will
> not
> > +      clear any status/interrupt flags at probe.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - nxp,interface
> > +
> > +additionalProperties: false
> > +
> > +# Schema constraints matching driver:
> > +# 1) If nxp,write-access is present, nxp,interface must be "primary".
> > +#    Rationale: only the primary may claim ownership; driver will set
> TWO=3D1.
> > +# 2) If nxp,interface is "secondary", nxp,write-access must not be pre=
sent.
> > +#    Rationale: secondary never claims ownership and cannot write
> CTRL/ST/alarm.
> > +#
> > +# Practical effect:
> > +# - Primary without 'nxp,write-access'; primary is read only; secondar=
y
> may
> > +#   write time registers.
> > +# - Primary with 'nxp,write-access'; primary owns writes, secondary is=
 read
> only.
> > +allOf:
> > +  - $ref: rtc.yaml#
> > +  - oneOf:
> > +      # Case 1: primary with write-access
> > +      - required: [ "nxp,write-access" ]
> > +        properties:
> > +          nxp,interface:
> > +            const: primary
> > +
> > +      # Case 2: primary without write-access
> > +      - properties:
> > +          nxp,interface:
> > +            const: primary
> > +        not:
> > +          required: [ "nxp,write-access" ]
>=20
> Aren't case 1 and case 2 here redundant? All you need to do is block inte=
rface
> =3D=3D secondary when nxp,write-access is present, which your case
> 3 should be able to be modified to do via
>=20
> if:
>   properties:
>     nxp,interface:
>       const: secondary
> then:
>   properties:
>    nxp,write-access: false
>=20
> I think your description for nxp,write-access gets the point across about=
 when
> it can be used, and the additional commentary is not really helpful.
>=20
Thanks for reviewing the patch.

We kept both cases: primary with write-access and primary without write-acc=
ess, because the hardware=20
supports three different ways it can be used, and we want to show that clea=
rly in the bindings:
=20
Primary with nxp,write-access: primary host can write to the device.
Primary without nxp,write-access - primary host is read-only, and the secon=
dary host can write.
Secondary - default role, with write access; when no primary host is claimi=
ng it.
=20
Even though both case 1 and 2 use nxp,interface =3D "primary", they behave =
differently.
Keeping both cases separate makes it easier to understand whether Primary h=
ost can write or not.

> > +
> > +      # Case 3: secondary (must not have write-access)
> > +      - properties:
> > +          nxp,interface:
> > +            const: secondary
> > +        not:
> > +          required: [ "nxp,write-access" ]
> > +
> > +examples:
> > +  # Single host example.
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    i2c {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      rtc@6f {
> > +        compatible =3D "nxp,pcf85053";
> > +        reg =3D <0x6f>;
> > +        nxp,interface =3D "primary";
> > +        nxp,write-access;
> > +        interrupt-parent =3D <&gpio2>;
> > +        interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> > +      };
> > +    };
> > +
> > +  # Dual-host example: one primary that claims writes; one secondary t=
hat
> never claims writes.
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    i2c0 {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      rtc@6f {
> > +        compatible =3D "nxp,pcf85053";
> > +        reg =3D <0x6f>;
> > +        nxp,interface =3D "primary";
> > +        nxp,write-access;
> > +        interrupt-parent =3D <&gpio2>;
> > +        interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> > +      };
> > +    };
> > +
> > +    i2c1 {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      rtc@6f {
> > +        compatible =3D "nxp,pcf85053";
> > +        reg =3D <0x6f>;
> > +        nxp,interface =3D "secondary";
>=20
> Maybe a silly question, but if you have a system that wants to have two p=
airs
> of RTCs, how would you determine which primary a secondary belongs to? I
> notice you have no link between these devices in dt so I am curious. Woul=
d it
> be better to eschew nxp,interface and have a phandle from the secondary t=
o
> the primary?
>=20
> I don't know anything about your use case or features, so maybe knowing t=
he
> relationship just is not relevant at all, or it can be determined at runt=
ime.
>=20
> Cheers,
> Conor.

This device can connect to two independent hosts via separate I=B2C buses.=
=20
Each host sees the same hardware instance through its own I=B2C address. Th=
e nxp,interface
property simply declares the host's role, so the driver knows whether to at=
tempt write
access or not.

Thanks
Lakshay

