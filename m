Return-Path: <linux-rtc+bounces-6851-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xUNLJIriRWpgGQsAu9opvQ
	(envelope-from <linux-rtc+bounces-6851-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 06:01:14 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4B46F3562
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 06:01:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=selector1 header.b=OCEBW2D6;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6851-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6851-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 875383003723
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 04:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFF12E1F06;
	Thu,  2 Jul 2026 04:01:08 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA276261388;
	Thu,  2 Jul 2026 04:01:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782964868; cv=fail; b=eTmZ0ADaubepstM1OENxKoGhgHFbVqsS3TGFkiPsfs8HPFCKkf1IPHx7ZLucPxy+qj9wyqQLNcs8Az4IgHNDzrqAz2WxXrfvsEi+Q2wgL2wsiyhcb6JXiFQMQlrZR4aWJoSnS96bAUJlNMoifMP5N69YT7btE/yqYwTuSa3ZaDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782964868; c=relaxed/simple;
	bh=djMrpiISg55ySWRkmzgqsHZAczNlV7i81/Avlh4pd5s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hSxjqi+nA5SVqRN+aziY+YuJ5KQseX3oe38R0PnIuaJFzh1H/FVBPN3G8LgK3yJiz/Nq0IgX6EIl7N/1BP73AX7vdwg5u4KLttSlt7h+ntD4GiqDerm7AK8Jf2kBX6CJ5jkYHUC+msIdeqDiuWHYW2O8zQJd77jA1ABmx58vTK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=OCEBW2D6; arc=fail smtp.client-ip=52.101.43.35
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mv4+5XVuOndgkvFdsInFDbnVqjmkQXMspqI+0k9H6sslIJNWTi29NPqhqBnFKShyJnKl68hv/E+f+3V04EgcytIBGOB18xxdogiZNJ05l4wDtjGFHeYmdv2x6ut39pEKfHyNpjSvLnM04KawxbZ/wB1rUu0sCnKdsiVxpt7J//4Gzhv0wUVJAHng9kaUIhOoTYo09iCDgKKCQIoksXQ6dd9XiP0lnbeL9GXBBR8URXsWyIBY9vQp/EHSgisUPsHVc4/aHfDgFs8kN33kaffkd+xdqo26bQUhobrPA6YnSoHfKU/CgRSG+GWVOaM+dJUu3XXJxvEc6zq9ERv+QsS4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djMrpiISg55ySWRkmzgqsHZAczNlV7i81/Avlh4pd5s=;
 b=T0GG6DN65od6UQDqo/FKSXzHOgRL562TCnDcmNSO3LcEfcFq5N8WNmPqS1iVuCfoUT2s4XjRruAnqk4ZN9kWqZFFl9Rf8v3UN+eYRoZHop5cX6HkC25L5BSDFVVS1dhv7Ik9Yq82aRSSVDtdw5C+xTtrfgXli13M+ng1UyGI4+p9Eg/UmIw40pQTzV9Ah+g0nCVcAzbOBUyvAvBXLxtm0gIKG9CCQH+isOAGMeg2om68MskmcLWS3adn02V0c1dPZ5OjlM9CLZgKo2AHBNLXvD+Puy29fAMu9iqK6vasoXO+J5tXEQA2XgPJkU9AUO66JsdDmbW/gsSgqdO30dVBOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djMrpiISg55ySWRkmzgqsHZAczNlV7i81/Avlh4pd5s=;
 b=OCEBW2D6rB3XOApPRGVA1o0qA31JVMcyuwsBux2BvvoneexATuxHFRJTdOB40YMX/etkgCT7sCqXTdmr7IIdeKc0sPQN8/+39LWDoPoSdtCBfUzHI4K6nr/xwqzrGofu4HVoVWYZfWtpUZoRzqnBeVcejvDUnSsYVwEvwbegkKg3T+AOzrR4avmNj4yIMkpA4QCWA/BUSBysN1pED8BMrlwWmk0pi9pf1qZ13UmcYCCv3LbLCUz5p/PvWgyWEsIkms8cxODsxsEOAtgjNoJRHuxeoCTMtEllf+BVmvEziwDHS0DKBXW3xgvp0/erHvuaF2jBHafT77bb3VteD/98zw==
Received: from SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 by PH8PR11MB6973.namprd11.prod.outlook.com (2603:10b6:510:226::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 04:01:02 +0000
Received: from SA2PR11MB4905.namprd11.prod.outlook.com
 ([fe80::5062:2:b851:5337]) by SA2PR11MB4905.namprd11.prod.outlook.com
 ([fe80::5062:2:b851:5337%6]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 04:01:02 +0000
From: <Balakrishnan.S@microchip.com>
To: <alexandre.belloni@bootlin.com>
CC: <amergnat@baylibre.com>, <baolin.wang@linux.alibaba.com>,
	<zhang.lyra@gmail.com>, <orsonzhai@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 4/4] rtc: s35390a: convert to dev_err_probe()
Thread-Topic: [PATCH 4/4] rtc: s35390a: convert to dev_err_probe()
Thread-Index: AQHc7lSqh0XLlZaxsUu2ZdbMr3C+fbZXigsAgADvKYCAABl4gIABP3SA
Date: Thu, 2 Jul 2026 04:01:02 +0000
Message-ID: <357be183-39a6-4830-9880-6f185a04877f@microchip.com>
References:
 <20260528-cleanup-dev-err-probe-rtc-v1-0-29dc9cb6c3f0@microchip.com>
 <20260528-cleanup-dev-err-probe-rtc-v1-4-29dc9cb6c3f0@microchip.com>
 <178283943069.3929176.6475131827523489401.b4-review@b4>
 <7867be72-2f25-4ea7-9b08-9ee8a8037ca1@microchip.com>
 <202607010857395be38657@mail.local>
In-Reply-To: <202607010857395be38657@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB4905:EE_|PH8PR11MB6973:EE_
x-ms-office365-filtering-correlation-id: 351cb53e-3c08-42c1-46e9-08ded7ee8862
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10086099003|22082099003|18002099003|38070700021|6133799003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 PnJj/rHkstKus78a5BJiOXICHUO6uIMjT/S5vV7Hud/U8XVtlCLhjMTWBsvaVLdNd2br+CZsnVrXWJnOkTjdGsyouPKWPCjeJpnjEHzncL5UzVtfWMJlue/0svIlz3l7KyXMKWlKeXFX92STIfsl/QTgydJGo5JN6YB+haV84p+nx09qF7vv2GQSPvY+BGiUxa/n3PnGlN+HZUtd+0R2VKJiZtbIe9NRPELzfqPC35UbFW4YOQpKjS15/wOBQrbAj0QFTCCIjrcUG7THVd5UJSp2OYQntmTMmuNQU+pVHbed4etwPqYn+bKmtV3cjpBKwu8QXXqZbRoXY6QSn0Q7wK1keoH4QzAsD8r2WpHraDZbg3gbZdZAuQb1vn4DhDFqZ7p1JzeawiArWXxB0YaATEei53x3JmtdCTgekO6ywo2HbynQ+k97J3NNz18BYBIpNXvhBNSKkXMoMTA/Ynw/wjplTeDQ8RSs3P5VlQxCwl8oAMaPE2Qn3geVvmw8ZfxoXm4LUvApgSJX2A3oH0l16gGP9FiWJlUt1+xwT1kktF4LYTDB0ZMwVjEn8D8GEPEIggPWGEvxmcq1iwZOCcXnIA79nv+98CvcJEeYa6CoNgG2xepMQu73+5WEt2g8WS7aNb+iMh70jOATYvDlxk2zhpToe9LPQIxLZKDqv4XM9Hk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4905.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10086099003)(22082099003)(18002099003)(38070700021)(6133799003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dndkd3BYUEF6UTlKLzN6aGZhbTNnNmd1VmhyYytaNEd1Y2p4a0dCcURGKy9R?=
 =?utf-8?B?UDltUWVES2ZYUDU4T2Z5UlEzSlBCd1lmbXNmSFlVdmpuOWQ3SjNTVUFlT2to?=
 =?utf-8?B?WVMyY2VnN0Q0bHFCSU1WU0NINzgvcWRkOFRidnhOcXQ4R3VmYXZmZ1dEQ3RO?=
 =?utf-8?B?bEVZYXJvMFh6NjJDTkFHS2RmRyt5UDhHMW5US2VKT0lPYmZYdnVQaUhOZ2p2?=
 =?utf-8?B?SWJiTzFXWHFldFp3Z3pVeXFvMThmdm13U3BUY0NjaEhiNmx5ZDBSbDREYXY3?=
 =?utf-8?B?NXo4bkNNMUphTWg5d1ZKakRWcmxEQkxFcFJzdlVOWFU4WTRrL0xOSDY2YmRo?=
 =?utf-8?B?cUZkb1hHMDNZSlZJWll0M0d6STN5TE1wVHBITDF5VkhtZUJvNHRGV1dxR2xC?=
 =?utf-8?B?dVk4L29LMEcwa1FHd0JlOFdmeno1dkI4aFFKdTNjMmNXRTd6eXUzR29OclRm?=
 =?utf-8?B?NTlvRURtWFhGY0k0WExWeWZUaVIyOWFYNklkVkVabi9xNlUrRVJ3YlM2N085?=
 =?utf-8?B?bGkveFZYM1lKZUhIT3VUeTVCb3dFbitxZ2ZGelVpbTQ1Q0c2VGE4c2lPS1Qx?=
 =?utf-8?B?R3hlUWR6T1VkODhQakVJU1ptRUJjVWlwdlg2eUV0eGJDWnpXNDY4RkJUR2o0?=
 =?utf-8?B?ZUUvYVFJWU9NOE5uUDBFSDArQ3R5aHBaODJWL082aVNxaUxxRVR6dmZMdG5J?=
 =?utf-8?B?Y3dxSVdHS2FqbXFFbUgvM1Z6V1BZcmh4Nkhla1l0dGZZWFhacVNGa2c1anVX?=
 =?utf-8?B?QTFZTVgwc1E3SXRmWmU1UUtMOVFGSFdjQXR2c21HbTF5Y2ZRNHluZ1lDSEc0?=
 =?utf-8?B?S2tsUEVoR1FQbWJmdEVCM2FmcGorbTQwTlhkcFhIY3RQd2YveG9WUjZablBm?=
 =?utf-8?B?TkxDVWJ1aW9yQitLTkJ0RGJHTUdFSVIweGpTSWVMWFFKVEV2Um9nZ1pDZXgv?=
 =?utf-8?B?cnlCakdtMW9XT0lCQWpBSzNZTTNyQm5kbnppOEJ4UlZ4OWVxMTErSXRJb1N6?=
 =?utf-8?B?VDUybk5vQWIwbnB3ckQveU5PRjZCZkNzSzJYQ1RUUm1zcHdLRG9JdUUzQThv?=
 =?utf-8?B?NmM5NkZqa21qUW02eDcxOEVjTEo3UGZyWXVrcEpNUnJuQjdxeE85bUhndjNU?=
 =?utf-8?B?SWJTYXR6NU5IVW9rRkpMdG1pUzNtYW1QOFcyNC9hYTFwNHdWWlpWd1hudnZ6?=
 =?utf-8?B?K0F2TFpCa0V6cnVubHVPVml6NFBrVk5UdTZWTEVZeC9vb1UzSm04RmkxSXlo?=
 =?utf-8?B?NDlQOFVUVm9sWFFmWjl2K21YRVRjSVpNL2pFYktiOGhCM0o4ckJkcDltbi9O?=
 =?utf-8?B?SFJMek9WbkdrcTlSOEp3TlI4QmxGN2ZEN3VZd3d2YVZ0bzlWL3EycklQRmpi?=
 =?utf-8?B?YmdNdzdRM1hPSkJVTytLc1NLVXdIcHBQbkVhMkVIcUF3VnUwWHl0V0ppOTFF?=
 =?utf-8?B?RktpYzBMTjN2VWtlYTJoQWd3ZkJpMFZUUGlwaUc2cCtZb3hHT09KYk1PR2Rx?=
 =?utf-8?B?ZTRlV0RBcmUwWUNqY3RyWVh4WDFSNnZMc1hBaGtKQlpUTUdxU3dPMHc1UXky?=
 =?utf-8?B?QlBwRjNRcmF4UmlhcEhrQTkwTGhlYldRZlRwdndRb01UN0lqNFdkRFpyWjZS?=
 =?utf-8?B?UkJjMUV6bEFpVnREb3V4dENkUVdFVjAyUGdNZlo2RXlyM1BLMDhTOG1RTHVq?=
 =?utf-8?B?Ky9VNTlBZWtXT3J5YURxK3cramRpaW0wdmJjZW1mZTgrazkxd25mVWFKRlVE?=
 =?utf-8?B?N2gxWHFiSGJ5MmltRDRFMUpGSTM0UDU5NmVHUWloZHpwNFMvQTdqR2tpZGJI?=
 =?utf-8?B?YmdhNk83UTR6djBhWG1uOGdqNjIzaHN4SlY4L3dvZ1FidzJOQ1M3UWRYZVRy?=
 =?utf-8?B?bWY4TGxEejVOVlRLUmt3NlBBVm94cEYrL3hRTWxWN1g2ZXlJYkRoL0UxZ0Fr?=
 =?utf-8?B?ZDNWdElvWnJ4czdrWE5GOXcyRmc1YWE5YnZTMUN0SmRnS0V3NkhIN3ZpeEN6?=
 =?utf-8?B?RWx3eUs5dzVtZGYybEIwSUtKalhteXNaeFlqdW4xS1p1QUt6SGdXRGtXelJi?=
 =?utf-8?B?RW1sbjZJZXl1ZUE2eGNVVFpjSW5KQzl4U01lK2dDM0hIcThkeWlxY0tmSzlD?=
 =?utf-8?B?SXV3bjJrcGl3Q1VGaWc4Q1lubHF0NUhEdkJXR2RrNHZUQS84UjVXeUl2bzVV?=
 =?utf-8?B?SkhMeXNiYjVFRktML0FDRG5jeE9yakZaRUk3cEVHa3hWWmVSTnhieFVMMVNY?=
 =?utf-8?B?K25IVW56WktFakNyTXE4TE1ybmV2UHNsZG5RODNmS3RKWGxhckVCaklDaUNt?=
 =?utf-8?B?WUxqVGRJaGZnTnZkd3FieDdHYzR0QlRES1h6SFVpWGRSbnluTkhtQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5B103EA733D7945837D9442F0C64840@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4905.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351cb53e-3c08-42c1-46e9-08ded7ee8862
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 04:01:02.3130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k9/v03A/eg/LDLvEJXVgmZ19t+doaOXDBmOuSANciMWmFKOPoLmSjzDwyeh4AiLiKFF+r0fU0iOxw03j/H5px9Xs1nhMENeZY612rt7IHOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6973
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6851-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,linux.alibaba.com,gmail.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[Balakrishnan.S@microchip.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:amergnat@baylibre.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:orsonzhai@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Balakrishnan.S@microchip.com,linux-rtc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-rtc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,microchip.com:dkim,microchip.com:email,microchip.com:mid,microchip.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B4B46F3562

SGkgQWxleGFuZHJlIEJlbGxvbmksDQoNCk9uIDAxLzA3LzI2IDI6MjcgcG0sIEFsZXhhbmRyZSBC
ZWxsb25pIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+
IEhlbGxvLA0KPiANCj4gT24gMDEvMDcvMjAyNiAwNzoyNjoyOSswMDAwLCBCYWxha3Jpc2huYW4u
U0BtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gSGkgQWxleGFuZHJlLA0KPj4NCj4+IFRoYW5rcyBm
b3IgdGhlIHJldmlldy9mZWVkYmFjay4NCj4+DQo+PiBPbiAzMC8wNi8yNiAxMDo0MCBwbSwgQWxl
eGFuZHJlIE1lcmduYXQgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBz
YWZlDQo+Pj4NCj4+PiBPbiBUaHUsIDI4IE1heSAyMDI2IDA5OjE2OjQ3ICswNTMwLCBCYWxha3Jp
c2huYW4gU2FtYmF0aCA8YmFsYWtyaXNobmFuLnNAbWljcm9jaGlwLmNvbT4gd3JvdGU6DQo+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtczM1MzkwYS5jIGIvZHJpdmVycy9ydGMvcnRj
LXMzNTM5MGEuYw0KPj4+PiBpbmRleCBhNDY3OGQ3YzZjZjYuLjM0MmZkMmI1NjhhMyAxMDA2NDQN
Cj4+Pj4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLXMzNTM5MGEuYw0KPj4+PiArKysgYi9kcml2ZXJz
L3J0Yy9ydGMtczM1MzkwYS5jDQo+Pj4+IEBAIC00NzksMTAgKzQ3OSw4IEBAIHN0YXRpYyBpbnQg
czM1MzkwYV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPj4+PiAgICAgICAgICAg
ICAgICAgcmV0dXJuIFBUUl9FUlIocnRjKTsNCj4+Pj4NCj4+Pj4gICAgICAgICBlcnJfcmVhZCA9
IHMzNTM5MGFfcmVhZF9zdGF0dXMoczM1MzkwYSwgJnN0YXR1czEpOw0KPj4+PiAtICAgICBpZiAo
ZXJyX3JlYWQgPCAwKSB7DQo+Pj4+IC0gICAgICAgICAgICAgZGV2X2VycihkZXYsICJlcnJvciBy
ZXNldHRpbmcgY2hpcFxuIik7DQo+Pj4+IC0gICAgICAgICAgICAgcmV0dXJuIGVycl9yZWFkOw0K
Pj4+PiAtICAgICB9DQo+Pj4+ICsgICAgIGlmIChlcnJfcmVhZCA8IDApDQo+Pj4+ICsgICAgICAg
ICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBlcnJfcmVhZCwgImVycm9yIHJlc2V0dGlu
ZyBjaGlwXG4iKTsNCj4+Pg0KPj4+IFRoZSBkZXZtX2kyY19uZXdfZHVtbXlfZGV2aWNlKCkgbG9v
cCBhYm92ZSB0aGlzIGh1bmsgc3RpbGwgdXNlcw0KPj4+IGRldl9lcnIoKStyZXR1cm4gUFRSX0VS
UigiQWRkcmVzcyAlMDJ4IHVuYXZhaWxhYmxlIikuIGRldl9lcnJfcHJvYmUoKSB0YWtlcw0KPj4+
IGZvcm1hdCBhcmdzLCBzbyBpdCBjb252ZXJ0cyBjbGVhbmx5Og0KPj4+DQo+Pj4gICAgICAgcmV0
dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHMzNTM5MGEtPmNsaWVudFtpXSksDQo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIkFkZHJlc3MgJTAyeCB1bmF2YWlsYWJsZVxuIiwg
Y2xpZW50LT5hZGRyICsgaSk7DQo+Pj4NCj4+PiBXb3J0aCBjb252ZXJ0aW5nIGZvciBjb25zaXN0
ZW5jeSB3aXRoIHRoZSByZXN0IG9mIHRoZSBwcm9iZS4NCj4+IFN1cmUsIEknbGwgZml4IHRoaXMg
dG9vIGluIG5leHQgcmV2aXNpb24uDQo+Pj4NCj4+Pj4gQEAgLTQ5MywxNiArNDkxLDEyIEBAIHN0
YXRpYyBpbnQgczM1MzkwYV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPj4+PiAg
ICAgICAgICAgICAgICAgLyogZGlzYWJsZSBhbGFybSAoYW5kIG1heWJlIHRlc3QgbW9kZSkgKi8N
Cj4+Pj4gICAgICAgICAgICAgICAgIGJ1ZiA9IDA7DQo+Pj4+ICAgICAgICAgICAgICAgICBlcnIg
PSBzMzUzOTBhX3NldF9yZWcoczM1MzkwYSwgUzM1MzkwQV9DTURfU1RBVFVTMiwgJmJ1ZiwgMSk7
DQo+Pj4+IC0gICAgICAgICAgICAgaWYgKGVyciA8IDApIHsNCj4+Pj4gLSAgICAgICAgICAgICAg
ICAgICAgIGRldl9lcnIoZGV2LCAiZXJyb3IgZGlzYWJsaW5nIGFsYXJtIik7DQo+Pj4+IC0gICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gZXJyOw0KPj4+PiAtICAgICAgICAgICAgIH0NCj4+Pj4g
KyAgICAgICAgICAgICBpZiAoZXJyIDwgMCkNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiBkZXZfZXJyX3Byb2JlKGRldiwgZXJyLCAiZXJyb3IgZGlzYWJsaW5nIGFsYXJtIik7DQo+
Pj4NCj4+PiBUaGlzIG1lc3NhZ2UgaXMgbWlzc2luZyBpdHMgdHJhaWxpbmcgbmV3bGluZSAocHJl
LWV4aXN0aW5nKS4gZGV2X2Vycl9wcm9iZSgpDQo+Pj4gZm9ybWF0cyBhcyAiZXJyb3IgJXBlOiAl
cFYiIGFuZCBkb2VzIG5vdCBhcHBlbmQgIlxuIiBpdHNlbGYsIHNvIHRoZSBsaW5lDQo+Pj4gcnVu
cyBpbnRvIHRoZSBuZXh0IGxvZyBtZXNzYWdlLiBTaW5jZSB5b3UgYXJlIHRvdWNoaW5nIHRoaXMg
bGluZSwgYWRkaW5nDQo+Pj4gIlxuIiBpcyBhIGNoZWFwIGZpeCBldmVuIGlmIHRoZSBpc3N1ZSB3
YXMgaGVyZSBiZWZvcmUgeW91ciBwYXRjaC4NCj4+PiBJIHJlY29tbWFuZCB0byBmaXggaXQgOykN
Cj4+IE9rYXkgbm90ZWQuIFdpbGwgZml4IGl0IHRvby4NCj4gDQo+IEhvbmVzdGx5LCBteSBwbGFu
IHdhcyB0byBub3QgYXBwbHkgdGhvc2UgcGF0Y2hlcyBiZWNhdXNlIG9uY2UgSSBkbw0KPiB0aGF0
LCBJJ2xsIGdldCBodW5kcmVkcyBvZiB0aG9zZS4gVGhlcmUgaXMgbm8gYmVuZWZpdCB0byB0aGUg
Y2hhbmdlIGFuZA0KPiBJJ2xsIGNpdGUgdGhlIGRldl9lcnJfcHJvYmUgZG9jOg0KPiANCj4gICAq
IFRoaXMgaGVscGVyIGltcGxlbWVudHMgY29tbW9uIHBhdHRlcm4gcHJlc2VudCBpbiBwcm9iZSBm
dW5jdGlvbnMgZm9yIGVycm9yDQo+ICAgKiBjaGVja2luZzogcHJpbnQgZGVidWcgb3IgZXJyb3Ig
bWVzc2FnZSBkZXBlbmRpbmcgaWYgdGhlIGVycm9yIHZhbHVlIGlzDQo+ICAgKiAtRVBST0JFX0RF
RkVSIGFuZCBwcm9wYWdhdGUgZXJyb3IgdXB3YXJkcy4NCj4gICAqIEluIGNhc2Ugb2YgLUVQUk9C
RV9ERUZFUiBpdCBzZXRzIGFsc28gZGVmZXIgcHJvYmUgcmVhc29uLCB3aGljaCBjYW4gYmUNCj4g
ICAqIGNoZWNrZWQgbGF0ZXIgYnkgcmVhZGluZyBkZXZpY2VzX2RlZmVycmVkIGRlYnVnZnMgYXR0
cmlidXRlLg0KPiAgICogSXQgcmVwbGFjZXMgdGhlIGZvbGxvd2luZyBjb2RlIHNlcXVlbmNlOjoN
Cj4gICAqDQo+ICAgKiAgICAgIGlmIChlcnIgIT0gLUVQUk9CRV9ERUZFUikNCj4gICAqICAgICAg
ICAgICAgICBkZXZfZXJyKGRldiwgLi4uKTsNCj4gICAqICAgICAgZWxzZQ0KPiAgICogICAgICAg
ICAgICAgIGRldl9kYmcoZGV2LCAuLi4pOw0KPiAgICogICAgICByZXR1cm4gZXJyOw0KPiANCj4g
DQo+IFdlIGFyZSBub3QgY2hlY2tpbmcgZm9yIEVQUk9CRV9ERUZFUiBpbiBhbnkgb2YgdGhlIGRy
aXZlcnMgc28gdGhlcmUgaXMNCj4gbm8gcG9pbnQgaW4gZG9pbmcgdGhlIGNoYW5nZS4NCk9rYXkg
dGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIExldHMgZHJvcCB0aGlzLg0KPiANCj4gDQo+IC0tDQo+
IEFsZXhhbmRyZSBCZWxsb25pLCBjby1vd25lciBhbmQgQ09PLCBCb290bGluDQo+IEVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQo=

