Return-Path: <linux-rtc+bounces-5078-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4148BBCBB35
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Oct 2025 07:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE996404A41
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Oct 2025 05:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C245121D5AF;
	Fri, 10 Oct 2025 05:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VSVCkIgu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013040.outbound.protection.outlook.com [40.107.159.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADE41494CC;
	Fri, 10 Oct 2025 05:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760073695; cv=fail; b=Z+11KsIaAppfR6nQkzFIwqb5jXvIj8DWHbn+espKVh5il3rfO4VZAmxXqnUKyZr3OuBXtQukQ/ui31IZHcHeIogyDZat+D0m7SprT66CBZX5gUb5oPXEv448sI+HgJzyf4xJjnOshoOfPKXHjZ0ARRu2W5U30nd6/stqduwvpmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760073695; c=relaxed/simple;
	bh=XaAJN1lrm9GJ/hbgyoiC/WvPIfBdD8PrAVXS08HtKdU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Sp4y0g0W8mzIViYmQFdk7HSQHAZlP+wE2ZMOY2Cs3bcQaftK1zXpTHOiceie7ChJ9DVtouq9jyNy4rNeONLNYM8QUjBimXgPAIeIqwbnicoU86mS5q7J048O3qgv+TNWF6yX3BZwo5RglW0gWXhd+0NmaQENBurR7jBE0ejqELg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VSVCkIgu; arc=fail smtp.client-ip=40.107.159.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/fdMXLWxdwstFNRPsv1p2BWcssSWuJLgitVQAx2zmWuNOsSGxGpMlXYTYacHMueTNkp9Y77HWMyFhuvhiSO1yAi1sl0IWLUtiIy9BAfVwEkEQ/tj8Z/j/nr9JudeYz/YYO/kuRDEAIihXyfQ+eca7LOVFxa+YauoqazymBuVmI2OQuqYPdRVkSmJOvhxgOsaphb+fDCE9eIrMTORlm6kMotgH07sZD9CzWxB0ojn6zvRfHeXoYPHF8T8ZBVPQBIo4lkA1c9QR9DFIFiPuF9ftBQ0UF5pqzQneo/czp8XXQ7wVu7Tqfe3IMnTTeNZeAsJxd4Dx5zB4j8KIT2sLIDew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KplX02vW8pMvke2otSvI3f0EnYaxajgaBXhBXWoFrkM=;
 b=bOKlSOjBc1jmpa20iHEEPX8G0ynjdeUFZGZDf5T/xH9TuZtPPKsM/l1DevJ9wsm7hIVIzxGrGXmqpYaFup+vDkxXMhDe45g142cJ3VfAlIF08Rs9kLfJEtphxMIAddDLpLOMjHjqy/zdZgXpR9VeS3GnCp9+/J9cNlU62Uhgq1CUBn2AVp/p4Y/fs86m1mJxOTeC0HdiWJu3vv/FMJKIbXNGiLqOj++MTZLVi8YO28QjMRYRhhfGVTfGq3UHrXMKOif96eoOojs8FsIeLrXqbNQMuPtgeZEqXLzHIS7T9Rb2Annf2qPHLoV00D1VpkArUW70Jt2WfSzBSPR12Bz4ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KplX02vW8pMvke2otSvI3f0EnYaxajgaBXhBXWoFrkM=;
 b=VSVCkIguDL19BR0E5j7xQvOGnEeaN25k7ltYoEyEeZF6/IXCK5eROyhN2SMk4xoNICbg8xZPLPTaprniiyC+LAf3Bgs6W+anbrGydIBbpp/qzt2RWc8jPcQUfWdz+o8L1cHUN/ggnz3ESopXzsG7wrrhB5sfewnMQtpWnM7w/ANgoZZ51sH7TrLDXRvgEe4R2tqbh1/Cp5fRYZcS3JKulG63mX5fvubx1udCs316lMc4Y4Tce8KSgfI7Vi2SD3/PGrgnNkW6TRiaijs5Z0J2VAx/h1Viof2jLo1vsRJJycHqn0DZqJOPavxF0zGNIDAxKdtdGeFzN9TOYMeeRnnQJQ==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by GV1PR04MB10352.eurprd04.prod.outlook.com (2603:10a6:150:1c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 05:21:27 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::e196:11a8:211:feaa]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::e196:11a8:211:feaa%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 05:21:21 +0000
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
Thread-Index: AQHcLH4RzEHMxRHWdEG2vrVmdCJ3xrShHtsAgBhv9oCAAJSAAIAAyNuw
Date: Fri, 10 Oct 2025 05:21:21 +0000
Message-ID:
 <AS4PR04MB9362B73FE631B14CA8412FB9FBEFA@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20250923113441.555284-1-lakshay.piplani@nxp.com>
 <20250923-capitol-easter-d0154d967522@spud>
 <AS4PR04MB93620F7CAD21F745B95FAF1CFBEEA@AS4PR04MB9362.eurprd04.prod.outlook.com>
 <20251009-shrank-caucus-5f42afa398fa@spud>
In-Reply-To: <20251009-shrank-caucus-5f42afa398fa@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|GV1PR04MB10352:EE_
x-ms-office365-filtering-correlation-id: b83e1823-2be7-4dde-dc46-08de07bcd94a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?eXsuxG5fIcGlNeK4hsO2F3QBO7OPy5tY9XrB5arO5G0fSwcKtgDf02LYOX?=
 =?iso-8859-1?Q?AfQP1dEpK+aPsahIS0IG4DRN0D3T8Vxj7uAnZGAOnba5qHCvTpSFO69K3X?=
 =?iso-8859-1?Q?v6GusmF3D//lvTZzvTeVqssEYFOGDsXto28frfmn1po9EK7jR8ZU7HOYMU?=
 =?iso-8859-1?Q?TnMNo/7ZxaqLU8WDa1U2vVtsV3MV4mgGjs08vQPkEN0j+61zKt5ep2MGZk?=
 =?iso-8859-1?Q?R3p4VOxXcH/eIkoMnOraxQ7cEamiiUr4oix8/YVrg4e9nrYLqaPsD0ISkf?=
 =?iso-8859-1?Q?PP6o/S3xGzPUiFpeGwjvNqQUV+EoDGiQGvS6RoGe4elOq8dVEfJKD2LPjF?=
 =?iso-8859-1?Q?DjluFp1IHR4nAIIRPr7M7+Yne3H+lPqrEtPz7H3A8Ms+xDAq5TQ1ilZLoR?=
 =?iso-8859-1?Q?IWvippgqxqnikBIJ9SXloNgmN1/1RMUTw6hb/+qHxIwjet2kSEsUXAhBKc?=
 =?iso-8859-1?Q?Hu0iPlDJsqn1wSnAb1iEKWsaNjg5uKvsX55IZBGe8Q/a6fbHeDg5VCtOFa?=
 =?iso-8859-1?Q?q2AUfrmV8/VRgzJ/YqzDaB/BCUwNMuEZhbVuABY3t6qY2k6OvAozEigrcO?=
 =?iso-8859-1?Q?LzGdMll+yNZVW9bRyR4YR0HpCEr9zEhEoetWRGnzH9rPyK2i8uJxyyIBQK?=
 =?iso-8859-1?Q?pux6uDAHvjxB1TNePhvirBzpDb4MfFz0aJLwoYHP+DbFqUvb0Mj9aMeBQn?=
 =?iso-8859-1?Q?8m6NYfRBK3iIEsyUPlajhdZxFpBvDYvHYB2uFxNOBwrfxcHHT2iN0GIGy2?=
 =?iso-8859-1?Q?K/3MhY0TewmMKct50LeEP8i+lbh8ZP8IW2y6is51LrSbl8IMJOXqjBZfII?=
 =?iso-8859-1?Q?ft552H79+kKPSR/Bnm2MsHEpBCC6i08yy4rlbE+tezkmLIUGir7bAGKoTl?=
 =?iso-8859-1?Q?a706TXUSqyGB/e8j+Pawsih93uFRC6//jthAnOfONKmffuAm6Gntdbt6fl?=
 =?iso-8859-1?Q?KRGr9Z+hNTDeCKKMQlAe/DDk7XwrnVmGdSUYBL8zCUTRntYeZbew9Kx8oA?=
 =?iso-8859-1?Q?tTtiJBX/jYR2huDIZmFNwQN7PdHwpf8hNmKZ6C+VjrnnzUyPBi8cmG5okE?=
 =?iso-8859-1?Q?7YOryW3IhM2EVHTOqbFWP+9M1qLYkpxAV1eKDiIiDMvP2ZoHmhYkcxTEVz?=
 =?iso-8859-1?Q?GNOl3q7pHZGzhluo0L0dSA6VNBj66bp5prmBV3HYnf9/T6VPacrcal4o2d?=
 =?iso-8859-1?Q?y9Rwduy6OZecHVmgUYJwlDjGPNpCTG1Gae7zt9VwZiMAybXGj8FruXcTE0?=
 =?iso-8859-1?Q?pnOXPOVRSIJX/JeDggoF4n/DBct9OYcQmQkjWLxq93TZHltUJOgImEfK+6?=
 =?iso-8859-1?Q?VKESIJgh3o6JAX8HRqzSkbCV5SQ8Jek6Pqt3zh1RX63WtOgXYp7a9lVg/i?=
 =?iso-8859-1?Q?IEozVk8g/4Ag+TvfKLvUjH63iiszS+Bc6CLd6s0vD1U1IHI6WSL65qJq0q?=
 =?iso-8859-1?Q?oP6+Hcp/XkHdsQD7sq1HFEEKvUnLyCOFKngVB0dYPf4iZWcGMIK1UHIDev?=
 =?iso-8859-1?Q?RDPJavMeXM0X1TbAkwv3x2KGn3ninr6oUiI8doxARUsw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cYATTV7VXXlmTI6SNYcxDMzJpZ2RR/U8BNYdsLY8fVw7A0GpYExFMUwIEy?=
 =?iso-8859-1?Q?P1GJNKdIR0WewYSNayxlIIMb6xXJRjZ1jy+R4NbcFKkRnCde9RGHkQjxlu?=
 =?iso-8859-1?Q?FFl2apLRbpwAFDpJuZKWgLlL9Z8N89F9Z0/8wvHU+9FT+LDQsum6v25NjF?=
 =?iso-8859-1?Q?0J6NFCp57dnMuPugOu/o6o9wVSG8WrkP+nRA/UDDDFMlXVV/XPpKagPTHV?=
 =?iso-8859-1?Q?u1X5iV3ALcW9D55cNCeL2LU8XbBUS2nYY/mdHZCMVzqUHKDC528B4kmcsb?=
 =?iso-8859-1?Q?gUg9vhP2LrXptne7X0YwKIZdxDD6+3QOSqge4L14r2EpFabeOEwgwUseDk?=
 =?iso-8859-1?Q?zkmJsMGyM9sLCHgXlbFfVKR4ckUe2RazmOaDIUG2/Fyf/L9IpcEmjPny3Z?=
 =?iso-8859-1?Q?wm60jYnBVAyh67KaV4OrO3mYZfL/gWZim6XIP5jxagFZXbVu4Exq8FFjNz?=
 =?iso-8859-1?Q?Nn2dXr4K4qH3zFjsv2QwS2J3U06cItbJ/6vN2RGnubrqDnOezvxwGIxdl8?=
 =?iso-8859-1?Q?XRcRhlJNsxpDs7hbLZIvcuB2pt9kXhy82NibfeB6qfPpyqY/+xTa+kfzJC?=
 =?iso-8859-1?Q?3sewfa5uzmtmmGjjocyEnDVVBImwMhblU7lOgJsfzAZkMXwWocUGeml4Fw?=
 =?iso-8859-1?Q?pMFyI4QTrVEfife0pdjZ8ImjbQl4oc991h6yOFvbRFRSraAiPZ4AMnYJcW?=
 =?iso-8859-1?Q?qCQGyYQjd2xlt3H6iJF45RX9eMdSsN3q7NRzEKP1v1oSy/PQhNSMLW0223?=
 =?iso-8859-1?Q?datWxDB4oNI49hdC1zDxHrSkOd5kRPPPjF4u0PHmhUOSL/ynFGe4iRC2vW?=
 =?iso-8859-1?Q?B5pcF8jNUMBjLT/2wEHaJWIc4qaWV7KiD9IQh+g4n3Eahm04aUY2pIuU7+?=
 =?iso-8859-1?Q?wQP8PbV2CWnT+u9AAda60q2tvJINSWlzZDSFcd5xYnxIkS25o1BZaurXZP?=
 =?iso-8859-1?Q?OofGXT7KZgutV0qD83sVrtFPQKg7F67o/WownEaZnUYsdHfvyfJZHZN2TG?=
 =?iso-8859-1?Q?vv+y4CYPtIBoiwvOBoltAUcoF/lhbwzEDhcqxSyYU78LOtrj9TGMYdS1za?=
 =?iso-8859-1?Q?AdnU/lkUfNFow+6kNPaBlDeGo8DQTutTE5ABzv0ZdpLI/odGO8m/oNydnD?=
 =?iso-8859-1?Q?i+B0DVgAdUheM2Ti+nbMcwuSsViLcZGKGSH1c0wRlMa9uDVJd0yUZl1XUh?=
 =?iso-8859-1?Q?7No1zdTgxLXDk5eGG1RAdg5v6YGOgYlHmDUwkZP7zFNHA5H7HrJj1MiC8A?=
 =?iso-8859-1?Q?xJ4r86efNbALg1TGfwCskTsPn3I2v+hedZt8psrnEVVU1nbx0NG+6d1aOK?=
 =?iso-8859-1?Q?PS+f4NoYO6Tc52ESQMqCEtN16tGlHyS/xriDpQQf8EiNkfHiw8XwMwQDHe?=
 =?iso-8859-1?Q?ohWUtM3gueIJ78ahcDRC3BVUpm1OKuGfcHu2AOyR64dlV4BGTgWgSf6tDX?=
 =?iso-8859-1?Q?CgrrVpvqylAc9iYxyvXMCJPJWHn3SyEhUluK9nda3zJYV4x3ZjdU6t/Kfa?=
 =?iso-8859-1?Q?TT7uWKW3+jjNUYLeQw/k/3VmM6sNfjiT1V2UhvGYsi7C+XyBMuNxfoso3O?=
 =?iso-8859-1?Q?0YjUQcM5oe9zU7tq3lc37kaFeQipbwqCY9wPPNscNohM53tXXnEhwAX1Fe?=
 =?iso-8859-1?Q?O3kmKamMXX1Fhs6r1oVPTJ44SmcnqH6d2T?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b83e1823-2be7-4dde-dc46-08de07bcd94a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 05:21:21.3885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SCFPskx/Vhm8oze0KVjt47vNoIWodffOXubn/oed50qYfsq4f9Uln7CB5lCcsXgMQV7r0yU5rLJ/u7Ji52rJ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10352



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Thursday, October 9, 2025 10:30 PM
> To: Lakshay Piplani <lakshay.piplani@nxp.com>
> Cc: alexandre.belloni@bootlin.com; linux-rtc@vger.kernel.org; linux-
> kernel@vger.kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; devicetree@vger.kernel.org; Pankit Garg
> <pankit.garg@nxp.com>; Vikash Bansal <vikash.bansal@nxp.com>; Priyanka
> Jain <priyanka.jain@nxp.com>; Shashank Rebbapragada
> <shashank.rebbapragada@nxp.com>
> Subject: Re: [EXT] Re: [PATCH v4 1/2] dt-bindings: rtc: Add pcf85053 supp=
ort
>=20
> On Thu, Oct 09, 2025 at 08:13:49AM +0000, Lakshay Piplani wrote:
> >
> > > -----Original Message-----
> > > From: Conor Dooley <conor@kernel.org>
> > > Sent: Wednesday, September 24, 2025 12:28 AM
> > > To: Lakshay Piplani <lakshay.piplani@nxp.com>
> > > Cc: alexandre.belloni@bootlin.com; linux-rtc@vger.kernel.org; linux-
> > > kernel@vger.kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> > > conor+dt@kernel.org; devicetree@vger.kernel.org; Pankit Garg
> > > <pankit.garg@nxp.com>; Vikash Bansal <vikash.bansal@nxp.com>;
> > > Priyanka Jain <priyanka.jain@nxp.com>; Shashank Rebbapragada
> > > <shashank.rebbapragada@nxp.com>
> > > Subject: [EXT] Re: [PATCH v4 1/2] dt-bindings: rtc: Add pcf85053
> > > support
> > >
> > > On Tue, Sep 23, 2025 at 05:04:40PM +0530, Lakshay Piplani wrote:
> > > > Add device tree bindings for NXP PCF85053 RTC chip.
> > > >
> > > > Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> > > > Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> > > > ---
> > > > V3 -> V4: Add dedicated nxp,pcf85053.yaml.
> > > >           Remove entry from trivial-rtc.yaml.
> > > > V2 -> V3: Moved MAINTAINERS file changes to the driver patch
> > > > V1 -> V2: Handled dt-bindings by trivial-rtc.yaml
> > > >
> > > >  .../devicetree/bindings/rtc/nxp,pcf85053.yaml | 128
> > > > ++++++++++++++++++
> > > >  1 file changed, 128 insertions(+)  create mode 100644
> > > > Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> > > > b/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> > > > new file mode 100644
> > > > index 000000000000..6b1c97358486
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> > > > @@ -0,0 +1,128 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) #
> > > > +Copyright
> > > > +2025 NXP %YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/rtc/nxp,pcf85053.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: NXP PCF85053 Real Time Clock
> > > > +
> > > > +maintainers:
> > > > +  - Pankit Garg <pankit.garg@nxp.com>
> > > > +  - Lakshay Piplani <lakshay.piplani@nxp.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - nxp,pcf85053
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  nxp,interface:
> > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > +    enum: [ primary, secondary ]
> > > > +    description: |
> > > > +      Identifies this host's logical role in a multi-host topology=
 for the
> > > > +      PCF85053 RTC. The device exposes a "TWO" ownership bit in th=
e
> CTRL
> > > > +      register that gates which host may write time/alarm register=
s.
> > > > +        - "primary": Designated host that *may* claim write owners=
hip
> (set
> > > > +          CTRL.TWO=3D1) **if** write-access is explicitly requeste=
d.
> > > > +        - "secondary": Peer host that writes only when CTRL.TWO=3D=
0
> (default).
> > > > +
> > > > +  nxp,write-access:
> > > > +    type: boolean
> > > > +    description: |
> > > > +      Request the driver to claim write ownership at probe time by=
 setting
> > > > +      CTRL.TWO=3D1. This property is only valid when
> nxp,interface=3D"primary".
> > > > +      The driver will not modify any other CTRL bits (HF/DM/etc.)
> > > > + and will
> > > not
> > > > +      clear any status/interrupt flags at probe.
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - nxp,interface
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +# Schema constraints matching driver:
> > > > +# 1) If nxp,write-access is present, nxp,interface must be "primar=
y".
> > > > +#    Rationale: only the primary may claim ownership; driver will =
set
> > > TWO=3D1.
> > > > +# 2) If nxp,interface is "secondary", nxp,write-access must not be
> present.
> > > > +#    Rationale: secondary never claims ownership and cannot write
> > > CTRL/ST/alarm.
> > > > +#
> > > > +# Practical effect:
> > > > +# - Primary without 'nxp,write-access'; primary is read only;
> > > > +secondary
> > > may
> > > > +#   write time registers.
> > > > +# - Primary with 'nxp,write-access'; primary owns writes,
> > > > +secondary is read
> > > only.
> > > > +allOf:
> > > > +  - $ref: rtc.yaml#
> > > > +  - oneOf:
> > > > +      # Case 1: primary with write-access
> > > > +      - required: [ "nxp,write-access" ]
> > > > +        properties:
> > > > +          nxp,interface:
> > > > +            const: primary
> > > > +
> > > > +      # Case 2: primary without write-access
> > > > +      - properties:
> > > > +          nxp,interface:
> > > > +            const: primary
> > > > +        not:
> > > > +          required: [ "nxp,write-access" ]
> > >
> > > Aren't case 1 and case 2 here redundant? All you need to do is block
> > > interface =3D=3D secondary when nxp,write-access is present, which yo=
ur
> > > case
> > > 3 should be able to be modified to do via
> > >
> > > if:
> > >   properties:
> > >     nxp,interface:
> > >       const: secondary
> > > then:
> > >   properties:
> > >    nxp,write-access: false
> > >
> > > I think your description for nxp,write-access gets the point across
> > > about when it can be used, and the additional commentary is not reall=
y
> helpful.
> > >
> > Thanks for reviewing the patch.
> >
> > We kept both cases: primary with write-access and primary without
> > write-access, because the hardware supports three different ways it can=
 be
> used, and we want to show that clearly in the bindings:
> >
> > Primary with nxp,write-access: primary host can write to the device.
> > Primary without nxp,write-access - primary host is read-only, and the
> secondary host can write.
> > Secondary - default role, with write access; when no primary host is
> claiming it.
> >
> > Even though both case 1 and 2 use nxp,interface =3D "primary", they beh=
ave
> differently.
> > Keeping both cases separate makes it easier to understand whether Prima=
ry
> host can write or not.
>=20
> Just explain it properly in the property description, creating if/then/el=
se stuff
> with additional commentary like this makes it more, rather than less,
> confusing.
>=20

Understood - we'll simplify the schema by keeping only the if/then constrai=
nt and move the explanation
of the valid configurations into the property descriptions for nxp,interfac=
e and nxp,write-access rather than=20
in comments.

> >
> > > > +
> > > > +      # Case 3: secondary (must not have write-access)
> > > > +      - properties:
> > > > +          nxp,interface:
> > > > +            const: secondary
> > > > +        not:
> > > > +          required: [ "nxp,write-access" ]
> > > > +
> > > > +examples:
> > > > +  # Single host example.
> > > > +  - |
> > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > +    i2c {
> > > > +      #address-cells =3D <1>;
> > > > +      #size-cells =3D <0>;
> > > > +
> > > > +      rtc@6f {
> > > > +        compatible =3D "nxp,pcf85053";
> > > > +        reg =3D <0x6f>;
> > > > +        nxp,interface =3D "primary";
> > > > +        nxp,write-access;
> > > > +        interrupt-parent =3D <&gpio2>;
> > > > +        interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> > > > +      };
> > > > +    };
> > > > +
> > > > +  # Dual-host example: one primary that claims writes; one
> > > > + secondary that
> > > never claims writes.
> > > > +  - |
> > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > +    i2c0 {
> > > > +      #address-cells =3D <1>;
> > > > +      #size-cells =3D <0>;
> > > > +
> > > > +      rtc@6f {
> > > > +        compatible =3D "nxp,pcf85053";
> > > > +        reg =3D <0x6f>;
> > > > +        nxp,interface =3D "primary";
> > > > +        nxp,write-access;
> > > > +        interrupt-parent =3D <&gpio2>;
> > > > +        interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> > > > +      };
> > > > +    };
> > > > +
> > > > +    i2c1 {
> > > > +      #address-cells =3D <1>;
> > > > +      #size-cells =3D <0>;
> > > > +
> > > > +      rtc@6f {
> > > > +        compatible =3D "nxp,pcf85053";
> > > > +        reg =3D <0x6f>;
> > > > +        nxp,interface =3D "secondary";
> > >
> > > Maybe a silly question, but if you have a system that wants to have
> > > two pairs of RTCs, how would you determine which primary a secondary
> > > belongs to? I notice you have no link between these devices in dt so
> > > I am curious. Would it be better to eschew nxp,interface and have a
> > > phandle from the secondary to the primary?
> > >
> > > I don't know anything about your use case or features, so maybe
> > > knowing the relationship just is not relevant at all, or it can be de=
termined
> at runtime.
> >
> > This device can connect to two independent hosts via separate I=B2C bus=
es.
> > Each host sees the same hardware instance through its own I=B2C address=
.
> > The nxp,interface property simply declares the host's role, so the
> > driver knows whether to attempt write access or not.
>=20
> That doesn't really answer what I was looking for. Is knowing the relatio=
nships
> either unimportant or determinable at runtime?

Primary and secondary are independent hosts connected to separate I=B2C bus=
es,
so, no relationship needs to be described between them.

Thanks
Lakshay

