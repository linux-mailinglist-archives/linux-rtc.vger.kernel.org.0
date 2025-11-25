Return-Path: <linux-rtc+bounces-5455-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA6BC8639F
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Nov 2025 18:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 465FB351A6E
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Nov 2025 17:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5626207A0B;
	Tue, 25 Nov 2025 17:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="LXVIUCDQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011001.outbound.protection.outlook.com [52.101.52.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10BA3C38
	for <linux-rtc@vger.kernel.org>; Tue, 25 Nov 2025 17:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764092124; cv=fail; b=DrnI5rbi+3q9H3X+g6jEOg2v2l2iWEMKBPeKV53oyBqcwpk2Rn6uZ0u2Z7zQ+fcHlfp2dc1Dds/yD9lcL76KdmopuggYhdCGMEF6uzEb34s+JZ9+m+Py3lREnLg7CGUUPQf4qA5kVSPO2Lp/QYw8EIZSlpGIq1/PX7x9o0wiW2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764092124; c=relaxed/simple;
	bh=88+YbeFNzYvOww/IhlyyMSxpsgn+XI115iwlwsJT7o0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TzrXRQOZylRadcTW7SnB7uj1XL7WShZOGuOSDgpPS3LeUEr1CZPPxpX/v2laTM28ccjGjf1Q7Icci+OxbLhN1J2YmgI76vy6vRSvzwh6L1yQLmQyRHGrdgzy6/ymBO683Y7Ksmsbm60gNRiXvzISeKrg+WTcL+ufWwVRyruH1/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=LXVIUCDQ; arc=fail smtp.client-ip=52.101.52.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyrwJiLrGpDFeU3mN2yH9UvG+bsZG7GAn5mbFMwX/qnrXPJBwyVfvLsdDDIws42u4V2U11MWBLR8nR221Jq7Jvtsi0JS3c3wTzv8XAlAboIDoAKBS0AmxE/tOhaX3exDP9mSrBjJO9Dgp4CNElQe8w9+tHfz/XN64xOhnAePcHWsz8xWnDAfFl7AWkRSTYbRc8erFZdt4gPWc83rglc43c3zcWY8YL/YIKGtTEav/CZZMXAaGLxHNodt/taFT7lE/9oYVrAU+2Qfni8nlb6CZnAda1yWvi6msCbCEzaL+O3cXmHCSr7hVrYDzA3OjSY08s6doNQPJMdi0IoWBQiV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s42HVvMDsADNVRcgls/kJaEV/YuWqek8mD2Xa0Rmm5A=;
 b=rWm7p/1ykzEz12TvSP4g0/HSJ2eNlOuZo1MgWRLSj0D0Idbs0xj9/KE+5A6ygbkbRdOxrOlp/Z2rnhld8+c3p+w+2DG6USeBNiR2ly+Vz3ExRstaz1PYhE/7aw3InZSs8701Z3iniWAmQ5F27t2M78UDMNYsr9+hOkVW6Ssp4DUxA3nzbb5c4AiWkKUehus5CSEiAbFvUWMOCPVAEI+aItJz15WsMFzOoL7VaCvB5/AlTznJNVyIEdCqPrqblJHQW4CjGRwcW/f97dRjs2mvg26+NIqLmoD226WG0Yv38/WoCJb6UQQYi5yMBH3xNTTTN2mmYRUU0myMMz0OMpWlIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s42HVvMDsADNVRcgls/kJaEV/YuWqek8mD2Xa0Rmm5A=;
 b=LXVIUCDQCz0UURB/21rwfgfaZSM8MNq8EAn18LUQ5ltLgYINR0XuOKBz7cKN+vMl/nNfAE8FLDnK4LYWoU+Dl9KMci2y5/uU2GRREzabAlC6ZIs6lxSjxFc9Mye4xFpb3Fti/OmSATpN0jEqyTwM90/5TgZRr2asxrOLWCDMVHIfN2pKZS7pYPO2PV3mJZitf4lMNS2R1Li5PJZrtvYC8dhhEd4Rr329YQhI7pE5D94XCM2Ef+s32zdSp03esOSZQ4KoXYwB9xY4N/0BPXUCC2RlB0/NOIschrv1jiE7DjQPBUJKoGABfEweYKWSLS2vCawoXtM0zGeaThlUc+uLwQ==
Received: from BN0PR08MB6951.namprd08.prod.outlook.com (2603:10b6:408:128::14)
 by MWHPR08MB10157.namprd08.prod.outlook.com (2603:10b6:303:289::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 17:35:20 +0000
Received: from BN0PR08MB6951.namprd08.prod.outlook.com
 ([fe80::4dd1:e1e:56b0:b178]) by BN0PR08MB6951.namprd08.prod.outlook.com
 ([fe80::4dd1:e1e:56b0:b178%3]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 17:35:19 +0000
From: "Anthony Pighin (Nokia)" <anthony.pighin@nokia.com>
To: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: interface: Alarm race handling should not discard
 preceding error
Thread-Topic: [PATCH] rtc: interface: Alarm race handling should not discard
 preceding error
Thread-Index: AQHcXjEQSz0yuaS2gkW0I5r9OdJZiw==
Date: Tue, 25 Nov 2025 17:35:19 +0000
Message-ID:
 <BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR08MB6951:EE_|MWHPR08MB10157:EE_
x-ms-office365-filtering-correlation-id: 5817d648-a287-4e96-ec6d-08de2c490143
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?f8DrSwXAsbjOUCh/ljibT1Ws2ERtbofwd5QP/kFvsi/SsQRgNFwyeJyWqj?=
 =?iso-8859-1?Q?a/i+2fu4VXOg4PVfGkF+0eG/dnDOGMtwstBNLcFpwmOtYeA0v3ddAhhNNv?=
 =?iso-8859-1?Q?/KEPymA45pJ1djhVwSFKTqnVzS/21Kclpl8qsPRcO+ElF60hOdhXd3reEa?=
 =?iso-8859-1?Q?PRHZQK1mAVcajzbsOBYh0ILJpUZUuIIo6sBHAUpvSKKKUC4kMfNJzUHoQn?=
 =?iso-8859-1?Q?o315WRRR8s8cDtPb79T+bTd+u9R1BYXlxXXBZWfmyJMIzrWpjYzeAdej13?=
 =?iso-8859-1?Q?hJ26EmgoRXdOaA1MkVI55mz1255bLNcrfTbOPSxVHxU2ILfzU/LUhE58/w?=
 =?iso-8859-1?Q?JAgELAfs1Td9TL3LrIbYejdYL3jl3RfbVcH7AlPfJVLPH3EXNXtVYaKrKr?=
 =?iso-8859-1?Q?nnSt0hMsQBkC2EPA0JcphPK4xjrM3D2t/xhTiV2u+hxnFyZlldt61DV4NT?=
 =?iso-8859-1?Q?yZFsGiOOGkXs1gM31LbVuZjLVQ514OOcI0d+zSnUXm5l5hEvK6X3N/3klc?=
 =?iso-8859-1?Q?xJcYcTwYoLRwmoSa/2QL2ZEGfUjukMInwtGBUXtKIPUBXFWvzI9Suq+Dsx?=
 =?iso-8859-1?Q?OSftZj/cmgiRiklv7PC4NlCwEvAZm14mSe3A9wnAJZ3YUtAYEMnn3qOo7X?=
 =?iso-8859-1?Q?sjythph0XuP8C0YIN1CbHU3AGeXBIVO5gJQnIADO5TS520jQo8KvoBgQXX?=
 =?iso-8859-1?Q?43WltxnmxcPINro04tR65+rKrlyJj+4Qf1r1D78ohwrwwzRBrdWd6UcChN?=
 =?iso-8859-1?Q?6LczFFfO6Ev8osce0R1+M7fr5OlJSFNjcXWmY7Yjwa5bSxBgDNW1eZWJgR?=
 =?iso-8859-1?Q?7KgiQjqTO7BSx9+OgR84MUz629+QXDLiIhl5k3nXwId1kxpNChdL3UtWzY?=
 =?iso-8859-1?Q?lLWrtoz4QHuHQxNWu5zcuH5BwyTRKwlmUntzDF67gq0OJNzNSR+Sqwpiya?=
 =?iso-8859-1?Q?TuYPTZwNRgGLp25oYUQzIeWsivtCSDjq2Xo+eQcUBnQA7kyci5G4R4lzCU?=
 =?iso-8859-1?Q?gduj6QznLkw5OLdAbZ9lvlJqetQ140XRg+xaUzgHSHDRaJEABsGLfkKW97?=
 =?iso-8859-1?Q?tyzVmYoZN+RLooo3uV2IbHXlKhp5HZgyTWiYMXhreHFg/BDmZNL2/wL0j6?=
 =?iso-8859-1?Q?wrRsB7b4WBmJYBGMYCBaVREA5uTonP4QDqo9m47E4XGldxHO8UURU65+iN?=
 =?iso-8859-1?Q?AFsSFWlJPRdlMQzYejl0bSr3LnwrYVc4wOrDDNuJZ1kY4250n1I5oZ1U/6?=
 =?iso-8859-1?Q?60SXT6Quy1MOICsXnDzCbFwyuFqWU/w1rrprxYP6cKMdaKi9wX6+6Aqkto?=
 =?iso-8859-1?Q?mVp/u+k5cTC+Ve0BW89h3OArSjy5XJRbUcbCZ2ZgJohCQwfunq0iWJs5VI?=
 =?iso-8859-1?Q?2MA6crXfM4jqM8Re88lkUR0JYo4xhDQBPszm89lx05HusZp22Ld5qcNwTK?=
 =?iso-8859-1?Q?1rI+EMkfojsrRALl1USsrTiQRr7wS1VJd+unMWV/Ir2sSUlcEGlbe9RL+e?=
 =?iso-8859-1?Q?gtMIpohAGcu3jhqJ+dDkH67CDJiZ1//vfmENVit6zVd/vX3Aa7EVPkAo6b?=
 =?iso-8859-1?Q?2F9QgmQQzbgus9CgO3hXtUBpTk37?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR08MB6951.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?V+8UOYZTbHWGlbPZUQYgt6RPRKRlJXwBT0EJ0OBaw+AZYMpUXle/GgDgvU?=
 =?iso-8859-1?Q?IgTzpY/jAnO0EZ5CO/pVS03gkyJRjU+eIAux/wWODmMM0MyGb8Uroa3hWi?=
 =?iso-8859-1?Q?adjEzHQZAkexDOKXOC3QIi6f3YkQUj8uHWS0zy3GkqSkDIKadGtX6kXMpg?=
 =?iso-8859-1?Q?iM1l7bVU0Z3NfcsZQC9WZBn1S40F7f0qwe8cMU7kEkiPtJVTJ/IK48msl6?=
 =?iso-8859-1?Q?utZlJ/F70N+vsG4K6TqeM0TtXB8CDc8fqLBGDcO7YC8w/K7N0ilKYVQHyf?=
 =?iso-8859-1?Q?fdqxdaYTsKIOgqOVk6NgKLpDmy1/R7G8iQPMJGkwgcUpfzDPndfV4Iv/iv?=
 =?iso-8859-1?Q?1ES10oOKjuBUYqWmQscreldQtrQI3+QNkksgziAutxRTAMLswG8GB2+5jT?=
 =?iso-8859-1?Q?TZfhkWizYsJfdcMyKCbwLGnL0aoViY8al0gcCyulJGf+N3/CmI4rfPF32Y?=
 =?iso-8859-1?Q?Ox6ekh12yq/du/mFBLx1IkBDf1dx3S/Xnz0rlK6awDkdhepBCuXt42JQf6?=
 =?iso-8859-1?Q?MrQr/2wg5mDojfkhdwBxKebw8UFLbZS8S8zCI44r8n6vOv8Ml5SaLAAeZ3?=
 =?iso-8859-1?Q?WIhXfVCxctm6LsTKKpP0SRI5fgExZ5drvT02AoloIop+iFbRza8odoG3qV?=
 =?iso-8859-1?Q?QUpXFo2rVcgBvQC7xsXxVX9djiT5pTpI3wMl4isGE61bPJvGw0xwMSXQDo?=
 =?iso-8859-1?Q?hQ3iFIqdwiKVTdEyKvjTEqXv7j4Fxo1sS8YXScovyRuy33RmWYN9T2VU9w?=
 =?iso-8859-1?Q?3dLJ3VAQUz8oaFvc9BMyLeLIKOmkd3NbwK0AeYQZNUABiU7uGLsd8Kf4R1?=
 =?iso-8859-1?Q?FJIaKMCE4+NY6BO/Qw8DBeXzWQUyWj7yOicAXndqWDGbA9N2sdg3/huwM3?=
 =?iso-8859-1?Q?qn+Y8/mgtrMcJ/9ZI35s5CX3Y32zS45/iASYZer2xw1zRLPfIl4J+QEfI/?=
 =?iso-8859-1?Q?0mNvfS+8UIY3jbz/lFPzzInYxF7DSE5OUJ0bHS8ddOR6uO/vZ4ewE1m2Hm?=
 =?iso-8859-1?Q?FFzC8auIWP84Ekgir9zs8ZpaBPts9mpflQY0U7N3NNjBHV4DpRl2/xfRYB?=
 =?iso-8859-1?Q?PGliUqF7dYHOcYW1Cn/gNjifbQ9/GEueSW4CmZjdtwhwsK+9M5tl/gBjXn?=
 =?iso-8859-1?Q?RV5W9kgKzOWMcEhN9MyRDhQviZb90LhfHEnWs1GEKdT7ZfY6z+ApRSU+fK?=
 =?iso-8859-1?Q?/MAiDVZr5S4p8lQVRR8wmV9jg/nr5+eVv50ut0+V4FsOD0/Ki3YJfgjilj?=
 =?iso-8859-1?Q?t2QJ/XC1GT0Bmk8dhZb2Fi3LrJT9zjHUXVUtIvMDFz/MrkCNzLp6Z5q3lQ?=
 =?iso-8859-1?Q?bTh1iO0merBRbqCK6czdVooV5OoAAX+v81PSQ8tRVUqfqPgZUSOEsPOeQu?=
 =?iso-8859-1?Q?tf8HRRCJioLAEX84qVboY+dsaP3Au/Vhb1iRl/GR9TQcOBcxrdtx0SMPVP?=
 =?iso-8859-1?Q?KtjYFH+xI1T5Lt9Pl1ikdSZPhRO+eNsfCWf9QxIkZtER+Up1USd3xJ+9Fx?=
 =?iso-8859-1?Q?kQ8JjofYFlzJ3CTgNO+yelANkTWtVjKr4gMMqtlE7ml6q1w3kTsaN119o3?=
 =?iso-8859-1?Q?ZCzk4od8uCz1uJeEAuxKUqPOUuQWZzwf/jcNmGFbXoJt984TwoQ5i6Lfe8?=
 =?iso-8859-1?Q?sO06DV1/De7iNao+wN5twWz6OFndl+EGmS?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR08MB6951.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5817d648-a287-4e96-ec6d-08de2c490143
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 17:35:19.8364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qu3o6/EHXYMV7xSh2lJlYxT0maGV0h5+Ora7YrB1ziJuDmWVSlXxgRfjPf4v1uzFYPLH1YrP9mT0AF90E2enWA9rJl6VvUZVWG75YILT2fQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR08MB10157

Commit 795cda8338ea ("rtc: interface: Fix long-standing race when setting=
=0A=
alarm") should not discard any errors from the preceding validations.=0A=
=0A=
Prior to that commit, if the alarm feature was disabled, or the=0A=
set_alarm failed, a meaningful error code would be returned to the=0A=
caller for further action.=0A=
=0A=
After, more often than not, the __rtc_read_time will cause a success=0A=
return code instead, misleading the caller.=0A=
=0A=
An example of this is when timer_enqueue is called for a rtc-abx080x=0A=
device. Since that driver does not clear the alarm feature bit, but=0A=
instead relies on the set_alarm operation to return invalid, the discard=0A=
of the return code causes very different behaviour; i.e.=0A=
    hwclock: select() to /dev/rtc0 to wait for clock tick timed out=0A=
=0A=
Fixes: 795cda8338ea ("rtc: interface: Fix long-standing race when setting a=
larm")=0A=
Signed-off-by: Anthony Pighin <anthony.pighin@nokia.com>=0A=
---=0A=
 drivers/rtc/interface.c | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c=0A=
index b8b298efd9a9..1906f4884a83 100644=0A=
--- a/drivers/rtc/interface.c=0A=
+++ b/drivers/rtc/interface.c=0A=
@@ -457,7 +457,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, stru=
ct rtc_wkalrm *alarm)=0A=
         * are in, we can return -ETIME to signal that the timer has alread=
y=0A=
         * expired, which is true in both cases.=0A=
         */=0A=
-       if ((scheduled - now) <=3D 1) {=0A=
+       if (!err && (scheduled - now) <=3D 1) {=0A=
                err =3D __rtc_read_time(rtc, &tm);=0A=
                if (err)=0A=
                        return err;=0A=
--=0A=
2.43.0=

