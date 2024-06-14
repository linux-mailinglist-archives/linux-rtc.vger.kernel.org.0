Return-Path: <linux-rtc+bounces-1311-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2916908630
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 10:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DDF528C6A4
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 08:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF9918FC89;
	Fri, 14 Jun 2024 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UxKM0tLH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2044.outbound.protection.outlook.com [40.107.114.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7BB18FC6B;
	Fri, 14 Jun 2024 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718353383; cv=fail; b=Xj0Q3La8GYMO7Nx605B0npGj5f8BHMFtzaVkTdsKVe4H6GROEijlMGL2qzwhmllOjjPVVuOt/GRm2hWmpX9jRA8fitWNN7olnakp/pnvdkGPArx3s7tgmSUDVAclC7+U8xzDLpOlLS3yVc9DoYsUaP3jWIPwX4w//tKPVc4w7L4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718353383; c=relaxed/simple;
	bh=59Ti8GMywkeURNq4icycRdpI36xwbA6zze6wIdveRF8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r5/SVB/DiRaGCO+lM2GPo/BAvvIZzOA0540EzUANmBwZEks2j3DVR8b8UIKrHW2IymBILtR3FckkV22IoLCSXNCaMa72xJ4lkLId8RAgbbMCE/6BlgBy6O2n4vCXEhvFwA/PvD79H6lgtXcJ+2lyLQOEDVmU7FXZk14HDK1L9ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UxKM0tLH; arc=fail smtp.client-ip=40.107.114.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCjxY92t5ZkE1KmRlqY6LAciehY/yyPnuL4gAmh5xK6RD4ccdP8g44bLY9mcPuRoB5W5cpqXcBouvZaF1eioVOTt3Ocr+oNXWl2Ac7SWpOt9qvhlp28V2Vs6+7KuULpXfeMJtck3jBMqkIfGvR2Lobohefw9KDg8zLwoFGB7yTNRbiUUX8sCPhRWaPtlmBKkyFNpMLyXMCMEycbA4ndkwohM8OhclrejTWkWfiaF6Nu0Qgu1GrNy38RIqPPonXip2oumHmnLJcI0Tg2skCVOreNcEfmmmORLHvvhKXP45BiNQGm/x9D85HH4Cz5CGW+jRXqVFg0nBJqWDWC93LrDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59Ti8GMywkeURNq4icycRdpI36xwbA6zze6wIdveRF8=;
 b=WmKlSOHVN2Buaiqb94cHQsJLjRm2sZKKQNGNK9Bz2fPem+W5qNpeBlk/Jp0Tscjk3idq8xlPlKlvBxDEcK+w/+fM8d4GLQeyqMLtpeRbxLpgKFHY+dEMwTjnicVOEH/V1Ji778f/C11HN2zpheGp+qTKOFQziiDxinL+LIGERkztQtq+qOg8xhIMB3eGO1tiRlG4dEGdfKk1AdLRUUgamWiWPvfMb9SsqOTwFIYhFcwct6fzajr+4XLqaDdWhhl91mpUu2QjBrW6NbOsw9DnI/V4X2p68Tbsp01MCzPZMCtEayAUxodOHOZZOoQEKi66PzpH1mNUaktwAislCSxRzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59Ti8GMywkeURNq4icycRdpI36xwbA6zze6wIdveRF8=;
 b=UxKM0tLHioC6BcORzLrTTpbmYIBbKUvXkiEgqpo3xnL92TcEdFbbuwfuXmEIrDwawzo7F5+u2qVwcd8HytR0xhXW33RsZ8/fclMJ6iP8Cma/hpjvClsszjmiXEPHhc6H9ix99yLQA9iumZg5MA//J5SZi+0/TljMNnn/44Lv41c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6822.jpnprd01.prod.outlook.com (2603:1096:604:123::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 08:22:57 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 08:22:57 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the
 Renesas RZ/G3S RTC
Thread-Topic: [PATCH 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the
 Renesas RZ/G3S RTC
Thread-Index: AQHavitbIcpiZE+kDUKhRF+4WvcTrLHG4xNQgAAG94CAAABXkA==
Date: Fri, 14 Jun 2024 08:22:57 +0000
Message-ID:
 <TY3PR01MB113468BB7BC53E43F41C6D65386C22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-6-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113464811F43F19115FCF62A786C22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <d6b4e0cc-c16e-4ea7-bbc4-ddbaaadc9a25@tuxon.dev>
In-Reply-To: <d6b4e0cc-c16e-4ea7-bbc4-ddbaaadc9a25@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6822:EE_
x-ms-office365-filtering-correlation-id: 58b00459-e0ba-48ef-878a-08dc8c4b3269
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230035|376009|7416009|1800799019|366011|921015|38070700013;
x-microsoft-antispam-message-info:
 =?utf-8?B?U2t3N3RRYnZFZndpaHVkWlRCZ3RwL254S3ZUMUhvMDZDVzlmZUxYZitWQ3Ra?=
 =?utf-8?B?RDdOL0JIbTRsYWk2aC9QVkdMRVdJZnRZTGdjYjByS2oybjZNUllDSHRyN1A5?=
 =?utf-8?B?d2orancvd0J6N3pBSkJYeHRuamYwbDJscTE0M24vSDFhSmpMbVhPT084akgx?=
 =?utf-8?B?UHNYUk96WG5hN01rWFN1OUJZa3JqbEpuSXJMWFBFQ25PUlZvK0wyQ0VPdWF6?=
 =?utf-8?B?QkZBUnBicHNZZUsvaGdQOExCRlc1eWpPUGlWQnBHSVloelNTZURsRW9iVjJE?=
 =?utf-8?B?MEVrbktYNlFTUm1OdWFRZlZxYkFWREtLUGxqbDkzblNuYWIzdTlIMXR1Tmx3?=
 =?utf-8?B?MkFaTHFtcjN4aDdFcXlnbjhGVDA4SDdodzhQendVWXFxc2xWUExRMUVEK0Y1?=
 =?utf-8?B?dllKenFWcFFYTzJSS0Mvd3hDWi84VDlXaEE5L0luOURFMDJRS2FlVWxMUXVm?=
 =?utf-8?B?OFN4T1JUQyswaTh1dHFEMjVqR29SYkY5bG5tc0o4Y2l3QVRzNWs1YW9RSjUv?=
 =?utf-8?B?SVBiRTI1c1k5N3VROHFuclZHdHJkbUR1cHN5RHM3bGdncjVTSmJ5a2hoOGYx?=
 =?utf-8?B?UFZvTmZnMDdYZnhBSitXZFRxYmg5TGE2eHR4UTluME83WWNLOXByeHRzdEZM?=
 =?utf-8?B?cXIrZTlNR1N6SkxOcDZ5bnV2VFpNTGNYRW5ud1lpQXdMWHVwTVNHdUt0elU2?=
 =?utf-8?B?a0VWbjdBWVl1b3NEaEJ0T2IxNzFpbmc1NHFhOHZ3bkhyY05PRDhyMFdIOHhI?=
 =?utf-8?B?alFFSW9PV1lybUVwc1VtY0orcUU3Y2FVeFEyYUdld3RwejJTZUNUV0FFTUNw?=
 =?utf-8?B?TnBFejFPWmpzamR4UWtFb1htbWFreDA2UElad2w5cVEwNlc4OXdvWk1kRDFm?=
 =?utf-8?B?OXpiOXB3aWRURFh3NFRYNVVpaHNTOS9KVFlDTEJvOGhRYzdTZUg3c3o0OFhS?=
 =?utf-8?B?SE9xV1BzMHBHdkg1ZDVvWThocUd4Vmx4VzlKUWhFQ1ZQQ2g2bTZ2dmJsTk9C?=
 =?utf-8?B?QjVYQmJNN2tURkI0T0szaHFZS2FZOVI1aFNkRXJwNW90QXlhb2EwNlMzd0Jx?=
 =?utf-8?B?RjNOTngxQWMxNjA2RU9EQ0RTOWRoWHJZNVBGNHpORlBKOGJkeHNpaXlpZWFm?=
 =?utf-8?B?Vkp0MmVMb1R6NE5Nd29rNzlac2M3d01yUUIzRGc2aWttRGl6Rm9SUDNLZlNR?=
 =?utf-8?B?M3BrWkM2VlZHWHNjNmkyWWpNR3ZLTWU5WG5zTGo1bGp1dWdOb3ZZcWorTGo0?=
 =?utf-8?B?UVArWGZsWGwyb2hmK0kva3RVVWZ4SitZN2R4ZlhCSHFpcXRKVTMrbk14c2ZY?=
 =?utf-8?B?dTAxS2VOcEZZbkxpT3BPT1h6ck5BL24xNmQreFAxRnZJYTA1UXR0L0FJeUpX?=
 =?utf-8?B?VkI0WGZCdmhheGViOTlQUnRpMFE1MGN6THc4cFFLSXdhajlwdkRlNnAvekZU?=
 =?utf-8?B?cUJFMW90ZUJXUlJTMWhDSGpIbnduam9CVVlRUWtuY2tFOG1pMjk2c1Vlc0hK?=
 =?utf-8?B?aVFaaEhwUm9LY1p6ckc3dmR0TW9ZNkFEQThnRURrKzBMNjlXUUdtL203TVlS?=
 =?utf-8?B?ZU1pay9IKzA2MUFzRlB0d0JWM1BSVG5EeVVHVk5Xd0NucEFGNlBHVjVJbEhD?=
 =?utf-8?B?ektrd1NuSnRONlNsanRuOUpxOGRTclFvbjBNbENycXN3MnNPQjlwL3JQQ2hU?=
 =?utf-8?B?bEt6ZmZaQ2Y5WkZJNmRVUXpZcW9zMDZ5L2wyaU5tclVUaHFCM2Z2aDBWanJt?=
 =?utf-8?B?K0FxUTdEM2ZoWWttU0ozWHowNE1tanRmM2htVy9veG04aDEwUmc5amJ4VFJJ?=
 =?utf-8?B?QVQzS0ZoSTVsc2V3OUpOUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(7416009)(1800799019)(366011)(921015)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z3pwYlZvUDVOVzBsbVByRXl5WEdDTVViMmFmL0JnejB0WElLNjNVT2M1aHFJ?=
 =?utf-8?B?TlBZazlnWkFqdHBOR3oxdHRiVVkwSFVXaVpub05paDcyK3IxaHJZZUZCMGtO?=
 =?utf-8?B?VG1RbDNXcFd5dmxHc2R1VE00RGhtMmZtZ1JtdFlBTDdrbkQrRys3QUEyWW5h?=
 =?utf-8?B?RU16M0FSUHlMcjVyV0lnM2pPNlZGcCtaTDRnc2lOQXFBQjc5Z3hSQU9rU0tj?=
 =?utf-8?B?T3VOS1JwaDkwc3JXbkNXOWwxK3hMK0pNZm5iUGdjSENoR3lOa3BnN0p3VFdv?=
 =?utf-8?B?MXZwZ0UvVjJVUmJOTzE0QzdNS0VCTXZTZjMvK0gra0FkbFduZGVzbjg4aldC?=
 =?utf-8?B?T1kxSUFQeEg5bGV0dVdVQTVRaTdBVlN2ZDl0YUVnRFRNMGgvWnJMVHZGT0Zz?=
 =?utf-8?B?bDJma3lnbkNjeVJOb1ZRMVpCeStIQWk0ME5PbWljdkdEaytaNjZVOXdHUEZj?=
 =?utf-8?B?MWp0U0hLUE4yN0xaRjM3N1FTWFRkSW9MTkMvT01PeDRRUTIwQkFNdEJuWGha?=
 =?utf-8?B?SE53azk3Vk1BOXhUK0FsV2gwZjlraW83VWJZakhUalJFWSt1UUJRV1NTcmlm?=
 =?utf-8?B?N3F1S2RlclZ2b3pmSVlxS09UMCtKZTl1aVp1S01UcHRxZzN4eFRySTltLy83?=
 =?utf-8?B?TjJXT28yUE9xSTJVTTdzZm80ZDcrd2Q2VCtiaExFOGtSSFhFbEhvd1ZZUkFN?=
 =?utf-8?B?MW1TbUFiWnoxL0I5TXQyZGhxSFlIcnZpVmVuSFZFaGlCVWg2bFZoblhxbzNm?=
 =?utf-8?B?MHI0Z0xHV280T1QyUmJ3enNHc3lESnFMMW1KYmtDaHlrTzRwbWIwWlRHTzdi?=
 =?utf-8?B?TFVXY2RnY0VsUWgyRkdXSkR3L05IbmZJNjlXTW9SbXI4a0VZUFBFR0JqTHVl?=
 =?utf-8?B?bGptQlRUWStvUXNhNm1Nc2wxNEl0WXpkb3lrUVczUzlCUSsxeUVOWW16UlR0?=
 =?utf-8?B?SklqVzBKQ1B1bTB4VUM2cWp5Z256ZXcyQjI1T09KNFF1KzBDeFErVTlWUFZs?=
 =?utf-8?B?RUhWbU5tMS9OUXZ5L21iZmpyNUZ2TlZXc3E5czc0UWRxM05sSzRlZmQxY3dy?=
 =?utf-8?B?R0NCMmdtRklhRGpmbjdxem1UNUFFeDBOeTVMRGpKeXAvamJoOGJEMjhHVnM1?=
 =?utf-8?B?V3VNWTVHY3JDRUwydVpXcXFUVS9UaEhMcEFJY3o2ZXB6R1IwOS9jeFB1cnRq?=
 =?utf-8?B?T3hSR0tQYm9ycjZxRmN0VU9WU3lxUFEwL1B2cVl6ajZ3RzU1V01SZzNmaU84?=
 =?utf-8?B?L1lRTVB0V1BnLytHK2RYeEZKWEE0d2FvL20zcUF4ZUFNUWJIVXJ3Q0FDMWo0?=
 =?utf-8?B?WlBFVXpVM2lmcGVCcWVzZzhEL05mT0hDdFBFRHdhSGJOOEhjQ0g1UCtCM0di?=
 =?utf-8?B?T2g0cmN5MHhLMExCT1dCNFJLd3Q0N3NqdkViVjZBOURMR0o4cllIRW14dG05?=
 =?utf-8?B?U2hQOVFsMC81SWFsdmp5cE1wQnJ4dHpxU0VGVisvUXpHdFplSU1VOGMxV21T?=
 =?utf-8?B?L3gwREVTOXZ2My9Xa3RiRjhMb3A4UTAvYjB6Z0FVMjBISDE3K2x4VVZyckFJ?=
 =?utf-8?B?WlF2RVlvbmtnL00wUElmMHFGcHVGVE9CZ3BwS1dsaWwyR0pWdFYwSHhveGt0?=
 =?utf-8?B?Si9TU0NXT0MvZXBsb2FucDVtRmI2cjkyN3RJSDBCeHU5cWtHNGd3cWNCMGJh?=
 =?utf-8?B?R2lOdGZtc01DaS92SHVKaHhIZzN3WHY2VmdYR2xvMjFJVTlSaUo0UHN1VEJH?=
 =?utf-8?B?bVRRMUJvWHBkVStzOE1TczZnZE12VHVMUU9XYmhOaENnNVNJaWlodFJnSkF6?=
 =?utf-8?B?M2dUNW1mNjZVOEtwUzFvdUZmUHpVT0Z5WSt0eHBlWXV1V0c2UUw2Ukgzc0Fl?=
 =?utf-8?B?cXk1Q1o0c2hiWm1rY0xUNUV2bnZ3em04UUpnbmhSRzQ0aDA1cHpqWTVxR0lm?=
 =?utf-8?B?dWhaZzhvVjVEaTA3SVVJL2xUWEJZRWMrTFN6SVhwbjVmcjY4b3hvY1VHbnJq?=
 =?utf-8?B?SXJWWUNVcXJxUmNJQTJNdGYzTnAyOVFmejhjNTh1WmVBUkJvM1o2TVh0UEJs?=
 =?utf-8?B?S0lpKy9YRFdxeUVqSVlHWklBWVA2Z1JsV3FPV2pBUnlJK21tUjdvam4vQVNF?=
 =?utf-8?B?VDJ5NDBURlJ6UVRkZTRwa3pyL1lHV3ZqQ3g0OTY0c2k1dmdmUnBOejh1bUIy?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b00459-e0ba-48ef-878a-08dc8c4b3269
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 08:22:57.5826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wnbyp5ApjRMSjEuHZfYqE4dGBCkXb/tumRlVG40qgEHwoLn6WZ9dVOtewVUp/r956ntOMJCzLhVa39wo+bjagmx/f+jkV+BXXs484F2aIrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6822

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2xhdWRpdSBiZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gU2VudDogRnJpZGF5LCBKdW5lIDE0LCAyMDI0
IDk6MTcgQU0NCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47IGdl
ZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlOyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsNCj4gc2JveWRA
a2VybmVsLm9yZzsgcm9iaEBrZXJuZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0
QGtlcm5lbC5vcmc7IGxlZUBrZXJuZWwub3JnOw0KPiBhbGV4YW5kcmUuYmVsbG9uaUBib290bGlu
LmNvbTsgbWFnbnVzLmRhbW1AZ21haWwuY29tDQo+IENjOiBsaW51eC1yZW5lc2FzLXNvY0B2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1ydGNAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IENs
YXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCAwNS8xMl0gZHQtYmluZGluZ3M6IHJ0YzogcmVuZXNhcyxyemczcy1ydGM6
IERvY3VtZW50IHRoZSBSZW5lc2FzIFJaL0czUyBSVEMNCj4gDQo+IEhpLCBCaWp1LA0KPiANCj4g
T24gMTQuMDYuMjAyNCAxMDo1MywgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgQ2xhdWRpdSwNCj4g
Pg0KPiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+IEZyb206IGxpbnV4LWFybS1rZXJuZWwgPGxpbnV4LWFybS1rZXJuZWwt
Ym91bmNlc0BsaXN0cy5pbmZyYWRlYWQub3JnPg0KPiA+PiBPbiBCZWhhbGYgT2YgQ2xhdWRpdQ0K
PiA+PiBTZW50OiBGcmlkYXksIEp1bmUgMTQsIDIwMjQgODoxOSBBTQ0KPiA+PiBTdWJqZWN0OiBb
UEFUQ0ggMDUvMTJdIGR0LWJpbmRpbmdzOiBydGM6IHJlbmVzYXMscnpnM3MtcnRjOiBEb2N1bWVu
dA0KPiA+PiB0aGUgUmVuZXNhcyBSWi9HM1MgUlRDDQo+ID4+DQo+ID4+IEZyb206IENsYXVkaXUg
QmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPj4NCj4gPj4gRG9j
dW1lbnQgdGhlIFJUQyBJUCAoUlRDQS0zKSBhdmFpbGFibGUgb24gdGhlIFJlbmVzYXMgUlovRzNT
IFNvQy4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUu
YmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+PiAtLS0NCj4gPj4gIC4uLi9iaW5kaW5ncy9y
dGMvcmVuZXNhcyxyemczcy1ydGMueWFtbCAgICAgICB8IDYwICsrKysrKysrKysrKysrKysrKysN
Cj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspDQo+ID4+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQNCj4gPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9yZW5l
c2FzLHJ6ZzNzLXJ0Yy55YW1sDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQNCj4gPj4gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3JlbmVzYXMscnpnM3MtcnRjLnlhbWwNCj4g
Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3JlbmVzYXMscnpnM3Mt
cnRjLnlhbWwNCj4gPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPj4gaW5kZXggMDAwMDAwMDAw
MDAwLi4wZTE3ZjhhMzYxNTUNCj4gPj4gLS0tIC9kZXYvbnVsbA0KPiA+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3JlbmVzYXMscnpnM3MtcnRjLnlhbWwNCj4g
Pj4gQEAgLTAsMCArMSw2MCBAQA0KPiA+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+PiArLS0tDQo+ID4+ICsk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3J0Yy9yZW5lc2FzLHJ6ZzNzLXJ0Yy55
YW1sIw0KPiA+DQo+ID4gUGxlYXNlIG1ha2UgaXQgZ2VuZXJpYyByZW5lc2FzLHJ0Y2EzLXJ0Yy55
YW1sLiBGdXR1cmUgU29DcyBtYXkgdXNlIHRoaXMgSVAuDQo+ID4gU28gdXNlIElQIG5hbWUgaW5z
dGVhZC4NCj4gDQo+IEZyb20gd2hhdCBJIGtub3cgdGhlIGZpbGUgbmFtZSBzaG91bGQgY29ycmVz
cG9uZCB3aXRoIHRoZSBjb21wYXRpYmxlIHRoYXQgZmlsZSB3YXMgaW50cm9kdWNlZCB3aXRoLA0K
PiBhbmQgdGhpcyBvbmUgc2hvdWxkbid0IGJlIGdlbmVyaWMgYnV0IFNvQyBzcGVjaWZpYy4NCg0K
SSBtYXliZSB3cm9uZywgSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24sIHdlIHNob3VsZCB1c2Ug
InZlbmRvcixpcG5hbWUiIGZvciB0aGUgZmlsZW5hbWUNCmFuZCBjb21wYXRpYmxlIHNob3VsZCB1
c2UgdmVuZG9yLGlwbmFtZSBhcyBnZW5lcmljIGNvbXBhdGlibGUuDQpJZiB0aGVyZSBhcmUgZGlm
ZmVyZW5jZXMgYmV0d2VlbiBTb0NzLCB0aGVuIHVzZSBTb0Mgc3BlY2lmaWMgY29tcGF0aWJsZS4N
Cg0KQ3VycmVudGx5IHRoZXJlIGlzIG9uZSBkZXZpY2UsIHNvIG5vdCBzdXJlPz8NCg0KQ2hlZXJz
LA0KQmlqdQ0KDQoNCg0KPiANCj4gVGhhbmsgeW91LA0KPiBDbGF1ZGl1IEJlem5lYQ0KPiANCj4g
Pg0KPiA+IENoZWVycywNCj4gPiBCaWp1DQo+ID4NCj4gPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+PiArDQo+ID4+ICt0aXRsZTog
UmVhbCBUaW1lIENsb2NrIGZvciBSZW5lc2FzIFJaL0czUyBTb0MNCj4gPj4gKw0KPiA+PiArbWFp
bnRhaW5lcnM6DQo+ID4+ICsgIC0gQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJw
LnJlbmVzYXMuY29tPg0KPiA+PiArDQo+ID4+ICtwcm9wZXJ0aWVzOg0KPiA+PiArICBjb21wYXRp
YmxlOg0KPiA+PiArICAgIGNvbnN0OiByZW5lc2FzLHJ6ZzNzLXJ0Yw0KPiA+PiArDQo+ID4+ICsg
IHJlZzoNCj4gPj4gKyAgICBtYXhJdGVtczogMQ0KPiA+PiArDQo+ID4+ICsgIGludGVycnVwdHM6
DQo+ID4+ICsgICAgbWF4SXRlbXM6IDMNCj4gPj4gKw0KPiA+PiArICBpbnRlcnJ1cHQtbmFtZXM6
DQo+ID4+ICsgICAgaXRlbXM6DQo+ID4+ICsgICAgICAtIGNvbnN0OiBhbGFybQ0KPiA+PiArICAg
ICAgLSBjb25zdDogcGVyaW9kDQo+ID4+ICsgICAgICAtIGNvbnN0OiBjYXJyeQ0KPiA+PiArDQo+
ID4+ICsgIGNsb2NrczoNCj4gPj4gKyAgICBtYXhJdGVtczogMQ0KPiA+PiArICAgIGRlc2NyaXB0
aW9uOiBSVEMgY291bnRlciBjbG9jaw0KPiA+PiArDQo+ID4+ICsgIGNsb2NrLW5hbWVzOg0KPiA+
PiArICAgIG1heEl0ZW1zOiAxDQo+ID4+ICsNCj4gPj4gK3JlcXVpcmVkOg0KPiA+PiArICAtIGNv
bXBhdGlibGUNCj4gPj4gKyAgLSByZWcNCj4gPj4gKyAgLSBpbnRlcnJ1cHRzDQo+ID4+ICsgIC0g
aW50ZXJydXB0LW5hbWVzDQo+ID4+ICsgIC0gY2xvY2tzDQo+ID4+ICsgIC0gY2xvY2stbmFtZXMN
Cj4gPj4gKw0KPiA+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4+ICsNCj4gPj4g
K2V4YW1wbGVzOg0KPiA+PiArICAtIHwNCj4gPj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiA+PiArICAgICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4NCj4gPj4gKw0KPiA+PiArICAgIHJ0
YzogcnRjQDEwMDRlYzAwIHsNCj4gPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJ6
ZzNzLXJ0YyI7DQo+ID4+ICsgICAgICAgIHJlZyA9IDwweDEwMDRlYzAwIDB4NDAwPjsNCj4gPj4g
KyAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMxNSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwN
Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDMxNiBJUlFfVFlQRV9MRVZFTF9I
SUdIPiwNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDMxNyBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsNCj4gPj4gKyAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gImFsYXJtIiwgInBl
cmlvZCIsICJjYXJyeSI7DQo+ID4+ICsgICAgICAgIGNsb2NrcyA9IDwmdmJhdHRjbGs+Ow0KPiA+
PiArICAgICAgICBjbG9jay1uYW1lcyA9ICJjb3VudGVyIjsNCj4gPj4gKyAgICAgICAgc3RhdHVz
ID0gImRpc2FibGVkIjsNCj4gPj4gKyAgICB9Ow0KPiA+PiAtLQ0KPiA+PiAyLjM5LjINCj4gPj4N
Cj4gPg0K

