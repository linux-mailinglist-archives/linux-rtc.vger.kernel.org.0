Return-Path: <linux-rtc+bounces-1643-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BCE942EF7
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 14:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CC571C217EB
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 12:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4142E1B1504;
	Wed, 31 Jul 2024 12:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OFxN+QYo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F601B012D;
	Wed, 31 Jul 2024 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430055; cv=fail; b=t9Z6VYrNE7de+yriyd2gJdkozOmWIBMvIQHMaZL0chBGRz6IDNtRXDgUOjBYjR1ixBX4S/UU+iaYSkPM0BqpcxoLOcQGnGM5D+S/atrwC01rpKFIKe2gh5lhnf1KKgeO1QdgXuTsBdX4U0VrbrUD5eCQg/l9jZLApdjHhp6xzt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430055; c=relaxed/simple;
	bh=3ZrXc7dyEXDQLmXy4+anzWutGGiAYR2nUe71CkcL+bs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lz7cDkWY+3moC4pps1+//Pt9ODnSub9io9z0i49mw5FwQjWFHF0ka/pydqI6D8BIZ+Z+zMNh1zJFh6U4PqT/gZVEdV4J0d9HFFQmd95f2VaXYN2GwZlkmpk3Nyruj6l+gsn9Es9wmONxsIHq8vrHX6LXr0gmIQGXZUBODKb9Wgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OFxN+QYo; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EvreRyHwOwpQxxLHHabqWj0e7A0Wlt0HLBW/LfWCkLRK2ao7t/run0F8zny7s9le0KHN4G2KLJlT9une+TMRu8AI85CqIBaO3VSxaIEFzkW6+q38+fcz2gcj6h2GmTDagO+c1zurE9RrGstwCAbHS24JNlrJeY8yvCNU08fZBLXLygFVIikjG191BU828S2rWQ1FtHLbBdvzNzTirotibfDStBjTYDgaE8OkrFv4Ts9z2JFyDogMh9p8EwMOA18RU0HpZ8q0Z5+Uvi3fSfiZD0289QdR8MJ6azy+UiDWIaCHwZWEuvJF8UIAqeAc3Vg7/WEKxCGaV8BTUEHKwSZWrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3D20n0bAzqcjLjXnBhoWSF/wj8T59kOpyVPxkul4Tg=;
 b=coe86apywIRM5mXjSQHKVBf6iQremFYXPcGB+zOoGtxiXqTun7F8AHAcQfI+aaTARrsxMdtOA5nBnkfh+iWb5d0ze6SzcbiQ8gepH67cBNO1fEldW0w6Tg6ugE5rmvdifytHhdy64GgxBzZWloM9ElmKWbMbbKpIbfu07eOxR/Vc8/xDMXvStrNNU0iwlzIzTdnw0IgrWdHEnaK+Sn7JRVG30yXUYqhhJwzGvqrQU4ZHL123nvpVv20ipJBVYuVZ/UZR8VoGqSPQdaE0lUX5wZECrPz+ubSAY+YVTGm6N1u/IcX8FtHqCGa7F53uwsKTswaiZDM0JFzZ6PW6QZ/SUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3D20n0bAzqcjLjXnBhoWSF/wj8T59kOpyVPxkul4Tg=;
 b=OFxN+QYofMuH1qJsLgZdlliuwdlbjR1n+XTEcxkD699vWA1M2g4aSgUCCLEzUC86cP4vcQ8Q3p+zKYj0H0glLJETvbEqpIVjKp5cFLAKfkKGJE/7Vdq6EU9CdgWetvPf/VTyc9oKwKr4Et5DyfOhtgehfdskYCpFBBFE2K6kxAVRZo7/hkMOVtg0fn1Ue68+aLwnP5I+iXr1fkkJh9c9gyOuzXUYTsXbyacq2MtPdn8uoOammXuXptEhS7QKEVIQsmcA+rNQR6zNoSLmnczRfX7jnHjt/KMcClGF9fto5aB+imtIDpECom4UBXENauq7s7DSCZ+g6Qd2v7/1meR73w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7735.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 12:47:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 12:47:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 31 Jul 2024 20:56:07 +0800
Subject: [PATCH v7 3/7] firmware: arm_scmi: add initial support for i.MX
 MISC protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-imx95-bbm-misc-v2-v7-3-a41394365602@nxp.com>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
In-Reply-To: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722430577; l=11462;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Yc9fGdHVGpzX3AJqC0pvTwDCGUbMJnSIzJSsTgCSQww=;
 b=cn640NhUfp1RbVo4Gd+rQXRv6ThedXJ58myTsfVE3KGMRB6SgWkntdFVOmsOGmoSkEmrJW9pW
 fNAwlF/JLvqDmrm4ipW/v9IP866VOBPH9T4NsO9je+j2pYKJnQ0ljw7
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: bac46ca2-45a8-4e8e-bd0a-08dcb15ef00b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGxzZzVySE5IUWJ4TjJJd2ZuRkJPcXNnUG9WRjhySWMrMG9OVDVhbTgrc25L?=
 =?utf-8?B?Tk1vcDZib1VpVEUrSWNpUWlHUlNWdjJ2eFF0SzJyUEtGWjh3TmVha2VJSmJQ?=
 =?utf-8?B?SGQwaDhIODZ5K2pNRUtEOWdVTWxOZ0ZoMTRhK1FrNXFqSlBmMGpMK1pHUG1z?=
 =?utf-8?B?T3U1VmhqZ0UwV2dhWTRWTWZaTVh1YXkvU1YwSzdvdm00c2VpdG5tMWJoSkRK?=
 =?utf-8?B?Zm9HREhaaEduMFhYOHBOME1KZldiWEJRQ0V1MEc3NnljVGZvUUFob2tHL283?=
 =?utf-8?B?NkFxSFFnRGoyWnQ1bVVOajh6TXFkeTJNa21DRzd3M2k1ZW1nckFGU0NORlFV?=
 =?utf-8?B?VXZwZXVmSTB3Ynozc3ZSK1N6S3ZVeVV2b2EwVFpwNEJLNFo2eWVqU0ZjaCta?=
 =?utf-8?B?RmhpVjlabXJHc2g3dHVDcjUrOGxFRkk5MHR2cjZJL0lTS2cyK3hRK0hxNHNY?=
 =?utf-8?B?TnNGUEg0N0VlMHBRSXNkalYrMHNCTG5JVG5mNjNvVVFXL3M4S3VxL0xGYU9Y?=
 =?utf-8?B?QVFLUWROcEtEeFd1dkM4d2VwaFdaenhyRHBkMEdNTVFUNGNuN2pRdDFYZ2ts?=
 =?utf-8?B?TndUbTBKQkNoVC85bDNrOUFUL3prajJrTStrQVJZSDlJTCtiSXZsVWtrNisv?=
 =?utf-8?B?VUp4aC8yd0ZFU1pneC9wWDhSSXJMY09MSUQ0cmJUa3dDQU9KYlhKYXRwUnZ2?=
 =?utf-8?B?eEtuYTk2OXNBcDVndXdrM3hGL1BLWDdxZExDVnFlclJ6NTJYdVBUQXNoU0N0?=
 =?utf-8?B?SEFMK3dyREQxQVAxVEJDdENIVDFPL0VWWURLSXBXMVU2c01KemE3OU9nempz?=
 =?utf-8?B?OGNHZ2diZ21aYzZOOWlKcGJwUFRnQTRMN1lXKzNNMHZUODhxQmpCdUZnVm9W?=
 =?utf-8?B?cWgrUFJBV3FyaStoMmhwL2pFZlo0Mnd5c21RSVJiVTZhcGN4NkMzank0K1l3?=
 =?utf-8?B?Q25sQkFhaE1WMVNyUVpxeXJtMW1pNllsNklteXhDR3Fvb2pGUDNGT1RDc2Zm?=
 =?utf-8?B?bWdTRHV2VlJMcE91UENKUGlxRTNCblM0ZUZjQUJjTTJubHZUMGNvTlg0eWRI?=
 =?utf-8?B?R1F2T3dac1Y0ZHpaaXdDZElsbHVrZnM5eVFFQmlZS0tKUGdLSml2enRSL3JS?=
 =?utf-8?B?dFpxZ25ialBybWtwT0IxUU9ETU4rQUhzQTJUOTU4VEU3VWtNT3cxQ24vNWk1?=
 =?utf-8?B?ZXMyWEhWYVNHOW1MdlhpZ0ZIMWZkREdsaFp1cHo3UTRWVld4WVRrZGFDZ0pU?=
 =?utf-8?B?a0puTXRKejV4ZGlDaXMrdEw3LzRpQnozVElCa2x4eGdBV3VvTzVReEN5TS8w?=
 =?utf-8?B?ZVRKSVk0OUwyVGtuYUhkVVBFcmNkZmFtOEprSTNJZGtvdkpvSVNHNUFKUDZa?=
 =?utf-8?B?SmNvM3E1aldlbThodHdHOTFsWXV5MHpzcFVPZXFoQnZLeEU1bzZjdDNjYSth?=
 =?utf-8?B?SmtnOWpuL3hpUUNnN3AyaUZqTUpLbnlGMzFhK0hnWjdoRStaTWxwZHVRWnNS?=
 =?utf-8?B?WStERGdiWXhJeTkzY2VVeTZtcWFXTDk2KzgzdE9uSGdpbWwxalB5VlFtZmFl?=
 =?utf-8?B?K0E2Q2NuaE8xQjNwcmUrVC94K0dhWWY4TEFWR2ozZDRlbmU5bFFRZlg5a2gv?=
 =?utf-8?B?dzRNdE9wWDdZUzlrcmEwa0hRK0FRM0tFdHVIZU1XM0lrZHhwejNUUVZBZDZK?=
 =?utf-8?B?VEpVNGxJVVlZbWxIZC9lSXN6RmN3REduNXhDeU03OGw1VjBhVFRRTVFUQVZh?=
 =?utf-8?B?Y2NFYVRYLzM0S2FuNm92TlN4d1NhaHBHdHJFNVl3WXFtY2N1WndKQnJWQ1NU?=
 =?utf-8?B?VlVwa2l0RldzSWxDM1FQOXgxcmdrRG1lMWoyNUpyUHZVbUxaa0FJM2MvT25O?=
 =?utf-8?B?bldXUHdnZzBXa2xqdkw4T0I5ZS9SNDlFRklxbWhmckk4WXBBdVdJN0xYMktZ?=
 =?utf-8?Q?ER68dXO12zw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1FkM0RUazVJRWpNNlRGQUkrT1hIcTUyYmIyOTlJZUZXbE1LaU53TVAyd29I?=
 =?utf-8?B?OGkwUHI3QlJYWGw4YnhuYjkvellWYTE3Ny8zalptOVBtbk9OVUxETHpjOEFa?=
 =?utf-8?B?bGx0L1lSbVoxVVpmUUdvL1VSNjdZYURUdXlrSHUrcGRyZkhqOTMyWnJwNUFu?=
 =?utf-8?B?Y0Noa2ZTc01JbGdpaDJIbmJzVDE0Q0pRckw2OStuMVI1Ny96RW1USUJrbzR5?=
 =?utf-8?B?Szdzb3RVekpUSE9tQXRyM3ZMbWNRcGduc3dnYk9tZXlIcEQrdndoN0RwWWNz?=
 =?utf-8?B?VXk0SjVxTjNvMlFSd3pqbTYxemx0Ri9lRENtdjVndHpuWkk5b3pnTDRpcEVN?=
 =?utf-8?B?K3lXOWcyVTJ5NnFGWU5tWWRqMVVZQXJ3WmIvOE1lMFo2ZHRPczEzRjltcDF2?=
 =?utf-8?B?TGJDVXkwTVc5RUlTZ0hJSFVtUG55SU42ZklLK2F2ZXdDM1NsNFh2dndsNEUz?=
 =?utf-8?B?MTFRTzZMUzhodXJVS3RHWUVyTWFYUWE0RUxRaVl2MktLakdNQjcrMk5teWZQ?=
 =?utf-8?B?OTFhV2RrcE81ZmJLdi9pSHUveVk3eCtjR0E4K1I3NWxOVmk0RHRNKy9LV0tq?=
 =?utf-8?B?cms2dkhaWmw3UnJSQWVpRnE1UWN1RFZlTmhsRW43QjNQc1NsYXFURG5nZ1lv?=
 =?utf-8?B?YmIvTmVubVBnUHErWEtlRG9oZkxZYjFSU0RSWjE5TUhERUxmS3dvMjVGRCta?=
 =?utf-8?B?djZ5clJRNEpMcHNHSW9ncGtQZkRrVmM2eEwxdk9XbEdPQnNoSjBhTnRoSXF3?=
 =?utf-8?B?ai82OVYwSTRPNFNiSXlDUHRvb1pLcEh1NkNLdlh5UHFSVWhPdGdsNW9vbUlp?=
 =?utf-8?B?U1NkdXd3TzV1dS9yWjNHYjBFbmxCMy9NditqSnZPQVM3ZzRRc2c1UFFvdmYx?=
 =?utf-8?B?MlRxRUJFZ2p3ZnlTQTU0dnkrZGFKSTdUbHJlZ0R3OFROUTYrejYvVGppa1VB?=
 =?utf-8?B?WlZPY3A5dEhEZGRZOU9lcDBldUFxRDIwb29zT1dwNFNINnhNN1luWHI0Qkp0?=
 =?utf-8?B?dDlOOURpeVVIeTIzODdOUUFBQllLT1Y2VUYwcUxybjN0NzVMWEFaVEVJcTBS?=
 =?utf-8?B?NGd1RnZmaXQvTXdmME5PUy9VbHpvd2N0OStPUFBLYjQyeHJVZll0SWhsdEVW?=
 =?utf-8?B?NmJERUhyTDdwZzhzMnhmSjdOSFAxRVJUQ3pibWkvNitKeVpxeTNEZFluU0Zi?=
 =?utf-8?B?UGdlS0ZKZDRBQWp4RE5FNkpiZDM2RGZiL3g4d092R3ljREQ5SDBuU2NOWFhN?=
 =?utf-8?B?ZnZCanJMaXNvaWJiVFgwbmszbHZsTGFDZFY4R28vK0Z5bmdJdk9qQlpsQnh0?=
 =?utf-8?B?Q3lhcTZkM0Z0SFh6QjRMZFkvNCtuUkJrc0ZyWHJnRDIvMUhrTUVTVHUwMS9B?=
 =?utf-8?B?SHZvR2w2cU1hZFNWTVRZMnFRc0RnRFN4aEpUOXE4d21YQUpObU1MZkpuRDFv?=
 =?utf-8?B?UmlhS2hBNzIvQ0ZINUR5aFZhUnFPL05xMEFCTDdEYVpjdFFpaUUxd1VCY1h6?=
 =?utf-8?B?eVFoNjdwS3NEdXZhVXppTDNXK2kvN2JVaFQyWlBKeTdUbEs0eis3UUxKVzlU?=
 =?utf-8?B?dnMrNFVqZ2Y0QU01WHRZdGhGbVNNcU10RERhRUROYXh0emltSkRtTS9Cb3Yw?=
 =?utf-8?B?dTlBem9qREovOFlpeWxqVUVJdmdtUEc4bENCY05VL0NxMHc4S01tcDF0RGV4?=
 =?utf-8?B?eFlLNGJOeVZWNTVmT1B4d0xSMGJpRklPbFFacEEzZllTTHg0Q0JBNHVZandB?=
 =?utf-8?B?aWF2YWY3UWs1c1BpR1VkeCt0K2o5bjlMcTcyVnV5MEFDelVxdys5OW9HYlhZ?=
 =?utf-8?B?QkdpVmRkTFVnNlF5Y2czcHg2cEI4WFdUcWN4dWI0ejVLaGNXWk9uZSs4NWhK?=
 =?utf-8?B?ZUhrODFqejREYzN0Z0Y3elYxZVZ1VFkzckY2TURWMUNOYkozbnhpRkMycVJs?=
 =?utf-8?B?c3pkMXY2N2FOdlAwYmxwVlBraTJVMlZ0aUQ5dmpuMWYydU40amVFYWFDbkxy?=
 =?utf-8?B?enZjUThhRkhTMTNMZ016a3pmdjF3SmxDZDB6anRMelVoMk5sb0hFVkFaY0xw?=
 =?utf-8?B?amd3WUJWampuWjBOc3V4MWRtSzd3NXlaUUZ6cFRtMkVybVdOKytuNW9nU3Jv?=
 =?utf-8?Q?ngdi+qvuO5nzSze/kyw15Ksgj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bac46ca2-45a8-4e8e-bd0a-08dcb15ef00b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 12:47:29.3321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rc0NYNX1wv+OLYnXWoPW+MNHGQ0NxTRzXfoa8WbSOjflNzm9FhIQJ/EItpnMH2VvybdeVBKiNvQnKK6xtRp1wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7735

From: Peng Fan <peng.fan@nxp.com>

i.MX95 System Manager(SM) firmware includes a SCMI vendor protocol, SCMI
MISC protocol which includes controls that are misc settings/actions that
must be exposed from the SM to agents. They are device specific and are
usually define to access bit fields in various mix block control modules,
IOMUX_GPR, and other General Purpose registers, Control Status Registers
owned by the SM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/imx/Kconfig       |   9 +
 drivers/firmware/arm_scmi/imx/Makefile      |   1 +
 drivers/firmware/arm_scmi/imx/imx-sm-misc.c | 315 ++++++++++++++++++++++++++++
 include/linux/scmi_imx_protocol.h           |  17 ++
 4 files changed, 342 insertions(+)

diff --git a/drivers/firmware/arm_scmi/imx/Kconfig b/drivers/firmware/arm_scmi/imx/Kconfig
index 4b6ac7febe8f..e9d015859eaa 100644
--- a/drivers/firmware/arm_scmi/imx/Kconfig
+++ b/drivers/firmware/arm_scmi/imx/Kconfig
@@ -11,4 +11,13 @@ config IMX_SCMI_BBM_EXT
 
 	  This driver can also be built as a module.
 
+config IMX_SCMI_MISC_EXT
+	tristate "i.MX SCMI MISC EXTENSION"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	default y if ARCH_MXC
+	help
+	  This enables i.MX System MISC control logic such as gpio expander
+	  wakeup
+
+	  This driver can also be built as a module.
 endmenu
diff --git a/drivers/firmware/arm_scmi/imx/Makefile b/drivers/firmware/arm_scmi/imx/Makefile
index a7dbdd20dbb9..d3ee6d544924 100644
--- a/drivers/firmware/arm_scmi/imx/Makefile
+++ b/drivers/firmware/arm_scmi/imx/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
+obj-$(CONFIG_IMX_SCMI_MISC_EXT) += imx-sm-misc.o
diff --git a/drivers/firmware/arm_scmi/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/imx/imx-sm-misc.c
new file mode 100644
index 000000000000..ca79d86d542c
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/imx-sm-misc.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System control and Management Interface (SCMI) NXP MISC Protocol
+ *
+ * Copyright 2024 NXP
+ */
+
+#define pr_fmt(fmt) "SCMI Notifications MISC - " fmt
+
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+#include "../protocols.h"
+#include "../notify.h"
+
+#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
+
+#define MAX_MISC_CTRL_SOURCES			GENMASK(15, 0)
+
+enum scmi_imx_misc_protocol_cmd {
+	SCMI_IMX_MISC_CTRL_SET	= 0x3,
+	SCMI_IMX_MISC_CTRL_GET	= 0x4,
+	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
+};
+
+struct scmi_imx_misc_info {
+	u32 version;
+	u32 nr_dev_ctrl;
+	u32 nr_brd_ctrl;
+	u32 nr_reason;
+};
+
+struct scmi_msg_imx_misc_protocol_attributes {
+	__le32 attributes;
+};
+
+#define GET_BRD_CTRLS_NR(x)	le32_get_bits((x), GENMASK(31, 24))
+#define GET_REASONS_NR(x)	le32_get_bits((x), GENMASK(23, 16))
+#define GET_DEV_CTRLS_NR(x)	le32_get_bits((x), GENMASK(15, 0))
+#define BRD_CTRL_START_ID	BIT(15)
+
+struct scmi_imx_misc_ctrl_set_in {
+	__le32 id;
+	__le32 num;
+	__le32 value[];
+};
+
+struct scmi_imx_misc_ctrl_notify_in {
+	__le32 ctrl_id;
+	__le32 flags;
+};
+
+struct scmi_imx_misc_ctrl_notify_payld {
+	__le32 ctrl_id;
+	__le32 flags;
+};
+
+struct scmi_imx_misc_ctrl_get_out {
+	__le32 num;
+	__le32 val[];
+};
+
+static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
+					struct scmi_imx_misc_info *mi)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_imx_misc_protocol_attributes *attr;
+
+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
+				      sizeof(*attr), &t);
+	if (ret)
+		return ret;
+
+	attr = t->rx.buf;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		mi->nr_dev_ctrl = GET_DEV_CTRLS_NR(attr->attributes);
+		mi->nr_brd_ctrl = GET_BRD_CTRLS_NR(attr->attributes);
+		mi->nr_reason = GET_REASONS_NR(attr->attributes);
+		dev_info(ph->dev, "i.MX MISC NUM DEV CTRL: %d, NUM BRD CTRL: %d,NUM Reason: %d\n",
+			 mi->nr_dev_ctrl, mi->nr_brd_ctrl, mi->nr_reason);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_misc_ctrl_validate_id(const struct scmi_protocol_handle *ph,
+					  u32 ctrl_id)
+{
+	struct scmi_imx_misc_info *mi = ph->get_priv(ph);
+
+	/*
+	 * [0,      BRD_CTRL_START_ID) is for Dev Ctrl which is SOC related
+	 * [BRD_CTRL_START_ID, 0xffff) is for Board Ctrl which is board related
+	 */
+	if ((ctrl_id < BRD_CTRL_START_ID) && (ctrl_id > mi->nr_dev_ctrl))
+		return -EINVAL;
+	if (ctrl_id >= BRD_CTRL_START_ID + mi->nr_brd_ctrl)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int scmi_imx_misc_ctrl_notify(const struct scmi_protocol_handle *ph,
+				     u32 ctrl_id, u32 evt_id, u32 flags)
+{
+	struct scmi_imx_misc_ctrl_notify_in *in;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CTRL_NOTIFY,
+				      sizeof(*in), 0, &t);
+	if (ret)
+		return ret;
+
+	in = t->tx.buf;
+	in->ctrl_id = cpu_to_le32(ctrl_id);
+	in->flags = cpu_to_le32(flags);
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int
+scmi_imx_misc_ctrl_set_notify_enabled(const struct scmi_protocol_handle *ph,
+				      u8 evt_id, u32 src_id, bool enable)
+{
+	int ret;
+
+	/* misc_ctrl_req_notify is for enablement */
+	if (enable)
+		return 0;
+
+	ret = scmi_imx_misc_ctrl_notify(ph, src_id, evt_id, 0);
+	if (ret)
+		dev_err(ph->dev, "FAIL_ENABLED - evt[%X] src[%d] - ret:%d\n",
+			evt_id, src_id, ret);
+
+	return ret;
+}
+
+static void *
+scmi_imx_misc_ctrl_fill_custom_report(const struct scmi_protocol_handle *ph,
+				      u8 evt_id, ktime_t timestamp,
+				      const void *payld, size_t payld_sz,
+				      void *report, u32 *src_id)
+{
+	const struct scmi_imx_misc_ctrl_notify_payld *p = payld;
+	struct scmi_imx_misc_ctrl_notify_report *r = report;
+
+	if (sizeof(*p) != payld_sz)
+		return NULL;
+
+	r->timestamp = timestamp;
+	r->ctrl_id = p->ctrl_id;
+	r->flags = p->flags;
+	if (src_id)
+		*src_id = r->ctrl_id;
+	dev_dbg(ph->dev, "%s: ctrl_id: %d flags: %d\n", __func__,
+		r->ctrl_id, r->flags);
+
+	return r;
+}
+
+static const struct scmi_event_ops scmi_imx_misc_event_ops = {
+	.set_notify_enabled = scmi_imx_misc_ctrl_set_notify_enabled,
+	.fill_custom_report = scmi_imx_misc_ctrl_fill_custom_report,
+};
+
+static const struct scmi_event scmi_imx_misc_events[] = {
+	{
+		.id = SCMI_EVENT_IMX_MISC_CONTROL,
+		.max_payld_sz = sizeof(struct scmi_imx_misc_ctrl_notify_payld),
+		.max_report_sz = sizeof(struct scmi_imx_misc_ctrl_notify_report),
+	},
+};
+
+static struct scmi_protocol_events scmi_imx_misc_protocol_events = {
+	.queue_sz = SCMI_PROTO_QUEUE_SZ,
+	.ops = &scmi_imx_misc_event_ops,
+	.evts = scmi_imx_misc_events,
+	.num_events = ARRAY_SIZE(scmi_imx_misc_events),
+	.num_sources = MAX_MISC_CTRL_SOURCES,
+};
+
+static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
+				  u32 ctrl_id, u32 *num, u32 *val)
+{
+	struct scmi_imx_misc_ctrl_get_out *out;
+	struct scmi_xfer *t;
+	int ret, i;
+	int max_msg_size = ph->hops->get_max_msg_size(ph);
+	int max_num = (max_msg_size - sizeof(*out)) / sizeof(__le32);
+
+	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CTRL_GET, sizeof(u32),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(ctrl_id, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		*num = le32_to_cpu(out->num);
+
+		if (*num >= max_num ||
+		    *num * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
+			ph->xops->xfer_put(ph, t);
+			return -EINVAL;
+		}
+
+		for (i = 0; i < *num; i++)
+			val[i] = le32_to_cpu(out->val[i]);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_misc_ctrl_set(const struct scmi_protocol_handle *ph,
+				  u32 ctrl_id, u32 num, u32 *val)
+{
+	struct scmi_imx_misc_ctrl_set_in *in;
+	struct scmi_xfer *t;
+	int ret, i;
+	int max_msg_size = ph->hops->get_max_msg_size(ph);
+	int max_num = (max_msg_size - sizeof(*in)) / sizeof(__le32);
+
+	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
+	if (ret)
+		return ret;
+
+	if (num > max_num)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CTRL_SET, sizeof(*in),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	in = t->tx.buf;
+	in->id = cpu_to_le32(ctrl_id);
+	in->num = cpu_to_le32(num);
+	for (i = 0; i < num; i++)
+		in->value[i] = cpu_to_le32(val[i]);
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
+	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
+	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
+	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
+};
+
+static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_imx_misc_info *minfo;
+	u32 version;
+	int ret;
+
+	ret = ph->xops->version_get(ph, &version);
+	if (ret)
+		return ret;
+
+	dev_info(ph->dev, "NXP SM MISC Version %d.%d\n",
+		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	minfo = devm_kzalloc(ph->dev, sizeof(*minfo), GFP_KERNEL);
+	if (!minfo)
+		return -ENOMEM;
+
+	ret = scmi_imx_misc_attributes_get(ph, minfo);
+	if (ret)
+		return ret;
+
+	return ph->set_priv(ph, minfo, version);
+}
+
+static const struct scmi_protocol scmi_imx_misc = {
+	.id = SCMI_PROTOCOL_IMX_MISC,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_imx_misc_protocol_init,
+	.ops = &scmi_imx_misc_proto_ops,
+	.events = &scmi_imx_misc_protocol_events,
+	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
+	.vendor_id = "NXP",
+	.sub_vendor_id = "IMX",
+};
+module_scmi_protocol(scmi_imx_misc);
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index 2df2ea0f1809..066216f1357a 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -15,6 +15,7 @@
 
 enum scmi_nxp_protocol {
 	SCMI_PROTOCOL_IMX_BBM = 0x81,
+	SCMI_PROTOCOL_IMX_MISC = 0x84,
 };
 
 struct scmi_imx_bbm_proto_ops {
@@ -30,6 +31,7 @@ struct scmi_imx_bbm_proto_ops {
 enum scmi_nxp_notification_events {
 	SCMI_EVENT_IMX_BBM_RTC = 0x0,
 	SCMI_EVENT_IMX_BBM_BUTTON = 0x1,
+	SCMI_EVENT_IMX_MISC_CONTROL = 0x0,
 };
 
 struct scmi_imx_bbm_notif_report {
@@ -39,4 +41,19 @@ struct scmi_imx_bbm_notif_report {
 	unsigned int		rtc_id;
 	unsigned int		rtc_evt;
 };
+
+struct scmi_imx_misc_ctrl_notify_report {
+	ktime_t			timestamp;
+	unsigned int		ctrl_id;
+	unsigned int		flags;
+};
+
+struct scmi_imx_misc_proto_ops {
+	int (*misc_ctrl_set)(const struct scmi_protocol_handle *ph, u32 id,
+			     u32 num, u32 *val);
+	int (*misc_ctrl_get)(const struct scmi_protocol_handle *ph, u32 id,
+			     u32 *num, u32 *val);
+	int (*misc_ctrl_req_notify)(const struct scmi_protocol_handle *ph,
+				    u32 ctrl_id, u32 evt_id, u32 flags);
+};
 #endif

-- 
2.37.1


