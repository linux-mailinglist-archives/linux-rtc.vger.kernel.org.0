Return-Path: <linux-rtc+bounces-2921-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A22A11F1F
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jan 2025 11:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20E76188C84A
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jan 2025 10:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E86212B01;
	Wed, 15 Jan 2025 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="MiTTJSCT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04322080DF;
	Wed, 15 Jan 2025 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736936532; cv=fail; b=iDD5nDzx9HdJodfoj5xy2+IcCId1rqwWCrOzTUrV6/YEYh0+yXqgvIUN/f1TJO0TrG+QKoskWK8aoH/890/GMxPOqvcB8gr/rJLEwYpink5IbyI5vL8Aci8cHeEP131DtwiU62A0IeYHbBq0j4B9Z+UcA+HzrrVITeBxGOQEUN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736936532; c=relaxed/simple;
	bh=72Gd+zCrxgYCtJQi2eVm3nYoryzBsytTrroWd4eiZ0Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VOEiMSy2gOnxo4Cev2phUf+ccF8F1df63B0ufESMxHTaKOrPeckUSOR7637KLHx9cL0EQqWFxm51EMGrGQ6OT+Dss/9k7NCfTWgqBKYtUq7j5DAZSEMVN8cVXZM4B9OMLws++5kSfPRlmutxeXii1azjmPYbfJYQ4T7+qB4MZh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=MiTTJSCT; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F7KQsx006439;
	Wed, 15 Jan 2025 05:21:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=72Gd+
	zCrxgYCtJQi2eVm3nYoryzBsytTrroWd4eiZ0Q=; b=MiTTJSCT8W18hJ1fbqTLM
	SCMp6pIeWjKlTH0XK/rQqYmMPc8T7uLi6GK62jrLtNbS6minc5yOVliaJidziU0E
	PeR6Rz+FdiSsO+32q7KLxCaPEtC+VWz2iYuxCOdW/WAW/8WxmFNZ5UKXJBxlW47b
	30AqTN/TtZ+GjwzVrNgQDnOm/mLR9YDQ67/SkRpaV6gS116Q/Uc0oQ1fYT0Iho6Z
	5N4y3++rkYLcD8yuSZuB3QAyfXFMPfw+gTqvJwTQrzJhUKc2VSRsOAcBgLz1Io/Z
	TrPwWTyPv9Avipp/a0vR+ZTgQozzIRGAUNVM4jyZn2CQZmUqBr+HLpKJ/tCHSj+1
	Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012036.outbound.protection.outlook.com [40.93.6.36])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4463sf9xyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 05:21:38 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0UiryTr2ovda2+Y5DYMI5zxnzZJb+upy6U3UM586jHGF1PHT/dSLg2LQQDhi+i+B21mZjRxLVLnG8Ub0nXg3rTjTNR6YLnhdtlSqUsa27QW3yOEY2LsGbCWCqyTZZKv0ruj2FHBlZgZzH8gLC4DMlo/B3NicLP5zxlU/Fo0wxxmqawhePMYjlmBTp7DJWk+KSvfLi+O8prus08nOCoPGmc4mImOTp91Vbd/nqzf01dyiWtr51UrM48rVH/tigJCKfvarFD+6O/67glnKS5viYD3bDrcSKWhfsu229lCXNS69Nc98WZgSLwedB/ZItX4ePiLIKdMwIOAlT5ZRq69uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72Gd+zCrxgYCtJQi2eVm3nYoryzBsytTrroWd4eiZ0Q=;
 b=TFei1sFfSIY99yPn7V+GbsPwEZK+JxxBKk3oYA1o5zSCYhlWbdR3yFMatuI7t+iAHLH1wrXDgUO3pd0gj7Y7kWd8xiDlP1xXYz56e6TwVfNyX9Wra2nVbJpPAYbpj+2x33PYR+SlSZZ93PvRFUkRSI/OOsoJozkaaY6jF43pW4op4H7jyfCoLg6OBlRiDPDnficHWPJs8z5/WyErFAniIUptkOfcOSZ91BZlMTQBWtRiMR3s0jM3Zi4kZm3FYkpIlFpWto4EggwtKPQSyDSdDqE1YOyR+pd0DIlpHTp/s7hF1AGgvH0TXMZyX3/6Aj1NIxMX0qQCln1ypTawWfWWgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from LV8PR03MB7375.namprd03.prod.outlook.com (2603:10b6:408:18a::15)
 by CH5PR03MB7909.namprd03.prod.outlook.com (2603:10b6:610:20e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 10:21:36 +0000
Received: from LV8PR03MB7375.namprd03.prod.outlook.com
 ([fe80::2fb:72d7:bce9:ef82]) by LV8PR03MB7375.namprd03.prod.outlook.com
 ([fe80::2fb:72d7:bce9:ef82%7]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 10:21:36 +0000
From: "U, Pavithra" <Pavithra.U@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Miclaus, Antoniu" <Antoniu.Miclaus@analog.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean
 Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Christophe
 JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] dt-bindings: rtc: max31335: Add max31331 support
Thread-Topic: [PATCH v3 1/2] dt-bindings: rtc: max31335: Add max31331 support
Thread-Index: AQHbYoCVStVNgNuLl0qTX0IFQKHLbbMPsB8AgAfmaqA=
Date: Wed, 15 Jan 2025 10:21:36 +0000
Message-ID:
 <LV8PR03MB73752CF2725AF0CB79A5A8EBE5192@LV8PR03MB7375.namprd03.prod.outlook.com>
References: <20250109-add_support_max31331_fix_3-v1-0-a74fac29bf49@analog.com>
 <20250109-add_support_max31331_fix_3-v1-1-a74fac29bf49@analog.com>
 <5a5fttl5su6nqfnq7rs275tp3gpxauqacebacehxm7jj32dga4@tucnr4wkqnd5>
In-Reply-To: <5a5fttl5su6nqfnq7rs275tp3gpxauqacebacehxm7jj32dga4@tucnr4wkqnd5>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR03MB7375:EE_|CH5PR03MB7909:EE_
x-ms-office365-filtering-correlation-id: d4ef6703-244e-4564-782d-08dd354e6471
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VXovZnlBYWVNU2JhZmNzQXBMM3ZBN285akJPK3FLNmV3UkpoT2cwWmk1eWR0?=
 =?utf-8?B?TUp3dzIxclowSzJLeitVcU1heU53TUdMNGJ0bzJDTTRsN0phdkFCZTRBdVBR?=
 =?utf-8?B?elRibDM4dVg4VlRRZmc1SVQzN2hhMmh1TS9HeEtsNi9xbE5TWE5idFAzbjJs?=
 =?utf-8?B?bUMyUVdENmFUWjJIMXdDRDhHNDdpWlhTNGxsK0hpMkxuUUJ6RGZNcGtvYjZE?=
 =?utf-8?B?aWRBZTJLNnZQSTlDQ1RlTkQyZFBEYW5lS0I3bVMyVVVBbFlWZDBPUzkzVEFa?=
 =?utf-8?B?MkJoVmRwbHpQNms1c1dxSlpmSGpPb2RKbkNOOGdIcXJNWmRUeXpid1MyZ3dK?=
 =?utf-8?B?R04yaVNxZ2hxSzU3RFhBOE9HejN4TTVNY3pEQnRIMEplRytsdUp2REJBYWxk?=
 =?utf-8?B?cjZscmpZMHBCVEVnclRJNlk0R2lWbjRwNHR5bmZoQzRpbHg4cDY3N245S3FG?=
 =?utf-8?B?S2tGQ1JIUmR0QkJwNGNOTHJ4cWlmZXRVcitqRXJhNXEyMVN5MGlUMVZuWXMy?=
 =?utf-8?B?Z0I2R3ExeXE5MFY2eGsrUEtJL3NJeHRVNmZkVkhTZDUxNlZhdXRaUmNmQk1D?=
 =?utf-8?B?TXcveTlnZmwrNHhwZU9pY2hJRGp4U04zeTcwWGpHdUF5QWlveTliOW1scWN3?=
 =?utf-8?B?WDM0TG5aTklYT1YrOHFrbkcvb0RxN0g5Sko1QncrTzA0Tmgxc01RV3hTWXZo?=
 =?utf-8?B?NG04K3E0M0xOMTJyb1lRbEtPejhXSndSOVRTZjBkZllXUng4c0dHYlhoTXNa?=
 =?utf-8?B?V3BmNzFhWnRiVng3SHlvTklWMGM2cG52ZTR6aWF0OTgzUFA4MzVNNmFpdWNR?=
 =?utf-8?B?dTJRK3o2UWY4R1VRZ0ZOS2xJWWlwQ0RROWxra2krdk15cm9GU0JSVjJYaEpG?=
 =?utf-8?B?dDRsVGZoYXpCSGdmYlRxWllLQ1Y1b0FzTUxFVFVPVnN2VUpXNmxZYkZYUkht?=
 =?utf-8?B?N0k3Sit1aXdiYnM5c00vWS9qMDNaUDJWbVhnMENPaTdkeTBaVzA0ZEMrb1lS?=
 =?utf-8?B?UVE3UHFzZG1tWHBQUk90K3RxcW5kdnByalJ1a3lTRGovZm8zN1hCYXEwOEp4?=
 =?utf-8?B?c0E3b3o2bjErTFhCSWpHOFdKQkVCaXRpeGlLUytDMFdhY0wzcGNKblNlem5K?=
 =?utf-8?B?TzdqaDBYM3hkSExjZlg2QVFJT09qM3Irdy80QmN6ZGxnUThVK3daZXlTUnB4?=
 =?utf-8?B?bTBESEVCYzY1emIvNTliNjhxNjJNaE1lNlJraVBzS1EzTk5iTHRsMnB5c1p6?=
 =?utf-8?B?U2VWTHFMVTBCNzA3WE1UY0E2cjNIbnZVdE9sREphZmM4UEl2cHVodlJNR2FM?=
 =?utf-8?B?eFQ1U3IvcHRzdm9OMEZXbVNBYjRWR2NIWGJDSGRtT1NCZm5YRmM1bGJHdDl1?=
 =?utf-8?B?cVBMUnJuU1ExblplTEp4dFNWZ0ZyRWZRYUVkclkrSDgvOHBoaGprVG1peU05?=
 =?utf-8?B?UUMwY0d2SG41SktvVXRvamFKc1NzZkRmTnFuRHpqa3AzKzJxbkF6b1pBSk5P?=
 =?utf-8?B?eWdrQ3NkVktFQTd0M09mSU9hOCtRc1J6NWlhVndXcnhxek5lUld2TnZlRFJl?=
 =?utf-8?B?b1pORnE4NkRJbTVUUCtEb24vZmhWb1NMUU1xNzEvV2JYQVRqb0tQeHhsSUVs?=
 =?utf-8?B?NkV4RUZGSFcwU1pvb1JxTlhncDI5Wlg5RUF6aXhRT1Zib0ovYk9TYlFHQnFQ?=
 =?utf-8?B?bTdPMmZYdHN3NmEzQmtFWEVlRmI2bTFQd21JcmNBK2Jzc2N2dnFKL1A5Z1pR?=
 =?utf-8?B?bDJkRU5SMXNkZjZkSEVCNk9MUHY5clpmR3dJaXVYN1BGTm5aSVpFRUMwaGQ3?=
 =?utf-8?B?eTdhdWVLSHhKaXIyZ3M1OGNEZ09mOUI1OExrRVZNQ2ppRG1lYi9selR1L2pu?=
 =?utf-8?B?Uk1UeDJ0bDdjSTM4UXRickxhcTRMa1ZwYXVSdFo1aDMzc0FXSE5KM01vaXN1?=
 =?utf-8?Q?bQEs3P/QcFRrMEIn0un/IrP3qQ6G77sm?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7375.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NjR4NGdseFRrTEtROXVUUXBXVHQ1eEhFZW1DNDd3NDBJdFgrV1MvcHNqUmJj?=
 =?utf-8?B?Q1NGOEViTUQzdm1PdmNjR25ZbDFuSncwd3QwcmpPalpoaGtZdjMrZjFTeVdB?=
 =?utf-8?B?Y0U4M0Q2L2cwUFZuemVseU9LMW83cUNHb256NGNHZzQyN2ROSGw3cEt4NTRE?=
 =?utf-8?B?ZzV6VXNsNG1JZnZuSUJKazhGbDlSa2d3aldRQ2w4RXMyTldRdjNOTVBZc25X?=
 =?utf-8?B?RytTTUVPaFU4QWZBNDBDL2V1RWRWbWlyNllYZElZQ1l5bm5YOWtjZDIvZ2JR?=
 =?utf-8?B?RFNaNmpzK3hmSkpYRTh0b1gzQkk4N1pESXZpbEF2Rm9GVG85WVJGZVVpeVVq?=
 =?utf-8?B?NFhsUjI0b00zYitRQVAzRkpxZmJuZ2VaRlhYT2dzYWlpUEd0STdLZkZhQnNQ?=
 =?utf-8?B?dUVMTjRlZHcweW1EdlY4QWJaK1BpbUdRWW1YeUVCWDluR2c1cDJSbURzV0Vt?=
 =?utf-8?B?LzdPN1Q1MFdTS1VkMVBPRzFkbEYzRTZXTUNFZWFaMG02cTMxQVFuNXFwWG9l?=
 =?utf-8?B?ZVZ6Z0ZFM3F3R2NiOUkwT3lLaFpic1NDTE96WndTdlRXK2N1VEdXbDNXakVR?=
 =?utf-8?B?cFozZzV2ZXlVZ25xVndwK21jd0QwYzdsWUd1L1VmK2J4ZnphS1ZlanFOMTZz?=
 =?utf-8?B?UnFQMXFWT2hDWW81VkZCM1FxWHhnVXZkbHJkM2o2VjBKemc2aGJ5QTJIUGFj?=
 =?utf-8?B?SnpaVG5DemhYUDFiWFl5d2sySWZISHFBMUhadk04cUpnZzRVNzYzVWNkOStX?=
 =?utf-8?B?Ly9LM0M0MGJBVjlXclZmamVSL2M0TVJPK2F4SzVzZHlpMVROSmI2cHFuTmhB?=
 =?utf-8?B?djJ3c0Z5WDlrcStKN29VVHZsL1lFa3JrdGZUbTdUZW56RmprSXVHb0RJRWU4?=
 =?utf-8?B?b2JwMHZ1ZkFqWUZ1ckFxZ0JWbWg2VG1IY3NtSU5hWFMzVFFTRWo0a2FlaXZR?=
 =?utf-8?B?M2RRR3VTcUdVVmsybVVvdTFqSHFyUlJ3SzVsTjI0eFpUcFdYbHFOdWdLWmNR?=
 =?utf-8?B?cnh6bHgwQzFESjROb215c1NObGFrZUFOcFJ4YVVWZWs5VXRlamp3RHpwNWJp?=
 =?utf-8?B?NGsvUUpGM1pHVUc5am5ubmpPcEM2bTNUVXFtanhoNEpVMmxKak15WFF4VkVT?=
 =?utf-8?B?SU53ZXljSWEyVTVBYmNJby9ldEMwKzdFMGpwNkY4blZyUElhOUZqaDg5VGdv?=
 =?utf-8?B?ODl2YWFwVkVtNEpGTjhObnpKUWFkdG5KMGNDOFprSk5ZRHN5R1FZTGprRmI2?=
 =?utf-8?B?VnhnTlhxMHQvUVQ3WTFUbjN6amhpRXp2NXJTNUIxVXBXcFg4Wi9lcldHbjZz?=
 =?utf-8?B?Vi9KUlRSM0RUZ3NzeGNIcmVJL0xiNEM2WE1vTis0VkhrbmJOSG84eFBNV1Z1?=
 =?utf-8?B?UFFia0Z4Qy9KTExPb0xUT0hsMHlKT1dubUo2Q2pCQm8yRVRBSVYyNGVqWVlS?=
 =?utf-8?B?anFIZjhhUEhGRkFmRnIySjlSTDcrSEx6dzQvcEtmK0lFWHpJRkd3cDJST2RS?=
 =?utf-8?B?d1huQi9RQkROQStLZE95TUVxakcxQkIvUThQQlZqc1lja05Ba0VLZysvc25u?=
 =?utf-8?B?NnM1bFA4Qlp3WHdHVkE3WnVXRXRPUktWcUZWV3k3aUE5d0s0OXUyRFQ2dTdl?=
 =?utf-8?B?TWpXeStCVVZhc3pCanUzdy81VUlDSlVZWUlGT1hjT2V1YVRMZTlyYUE4ZUtK?=
 =?utf-8?B?WWcrdUtOS2xOVmN5OHFRYk1sL2djUDlORklnUHJFSmc3a3J0dkpqZXdLbGpT?=
 =?utf-8?B?bGsrRTdGMmFwUStHODJYWVo2L2E1OGowQWhkTHVTZWZDZDNmcGE3a0FPWXBO?=
 =?utf-8?B?aENyclIrOTZMODdmRW56Z0xNN2tsMm9iSk96ZlgyYU5ISmdncTdCR3lFMEZY?=
 =?utf-8?B?WUVFS20xYzMxTFBSeTZlb1RIaEhicTRDclpxMmIxb2hJM2VSTjBmRWYzUGw0?=
 =?utf-8?B?RG0yTmpPT1B6a3hJRGI2QXNzQnZ2R1VpcWtDTzZTUGJBNEVGYjZRNzlCTmFB?=
 =?utf-8?B?TUVTQjV4VTFaTVZzYzVyak1iR0lhbUZ6ME8xK1J2MCtuZzRmTExiOEM2RkI2?=
 =?utf-8?B?N2tOZjN0SUU1cWgyVzJCUXJhVHNIeVMxU3hMVXI0M04wNXBNSGFFUVpSOTMz?=
 =?utf-8?Q?JT877ZGEdRdNlg/Qfu7RtIkQq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7375.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ef6703-244e-4564-782d-08dd354e6471
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 10:21:36.4778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NIs1SXPz2sHmxRw3yOGD5DcY9JtjKIVqPdCe9fIEUdHbg8w0n9HMFGoGwfdBZYxqi++KeOdHU0YYqZKTO2wJjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7909
X-Proofpoint-GUID: atofQfVvRibDs4evGuxpKbj-v-mIbUSf
X-Proofpoint-ORIG-GUID: atofQfVvRibDs4evGuxpKbj-v-mIbUSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_04,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501150078

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMTAsIDIwMjUg
MjowNSBQTQ0KPiBUbzogVSwgUGF2aXRocmEgPFBhdml0aHJhLlVAYW5hbG9nLmNvbT4NCj4gQ2M6
IE1pY2xhdXMsIEFudG9uaXUgPEFudG9uaXUuTWljbGF1c0BhbmFsb2cuY29tPjsgQWxleGFuZHJl
IEJlbGxvbmkNCj4gPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPjsgUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZg0KPiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVs
Lm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IEplYW4NCj4gRGVsdmFy
ZSA8amRlbHZhcmVAc3VzZS5jb20+OyBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+
Ow0KPiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPjsg
bGludXgtcnRjQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBod21vbkB2Z2VyLmtlcm5l
bC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzJdIGR0LWJpbmRpbmdzOiBydGM6IG1h
eDMxMzM1OiBBZGQgbWF4MzEzMzEgc3VwcG9ydA0KPiANCj4gW0V4dGVybmFsXQ0KPiANCj4gT24g
VGh1LCBKYW4gMDksIDIwMjUgYXQgMDM6NTk6NTdQTSArMDUzMCwgUGF2aXRocmFVZGF5YWt1bWFy
LWFkaSB3cm90ZToNCj4gPiBNQVgzMTMzMSBpcyBhbiB1bHRyYS1sb3ctcG93ZXIsIEkyQyBSZWFs
LVRpbWUgQ2xvY2sgUlRDIHdpdGggZmxleGlibGUNCj4gPiBjcnlzdGFsIHN1cHBvcnQuIFdoaWxl
LCBNQVgzMTMzNSBvZmZlcnMgaGlnaGVyIHByZWNpc2lvbiwgTUVNUw0KPiA+IHJlc29uYXRvciwg
YW5kIGludGVncmF0ZWQgdGVtcGVyYXR1cmUgc2Vuc29yLiBNQVgzMTMzMSB1c2VzIEkyQw0KPiA+
IGFkZHJlc3MgYXMgMHg2OCB3aGVyZSBhcyBtYXgzMTMzNSB1c2VzIDB4NjkuDQo+ID4NCj4gPiBD
aGFuZ2VzOiBBZGRlZCBleGFtcGxlIGZvciBtYXgzMTMzMSBhbmQgbW9kaWZpZWQgdGhlIHJlZ2lz
dGVyIGFkZHJlc3MNCj4gPiBmb3IgbWF4MzEzMzUuDQo+IA0KPiAxLiBXaHk/DQo+IDIuIFdoYXQg
ZG9lcyBpdCBtZWFuICJjaGFuZ2VzIj8gWW91IGRpZCBtdWNoIG1vcmUgc28gSSByZWFsbHkgZG8g
bm90DQo+IHVuZGVyc3RhbmQgdGhpcyBwYXJhZ3JhcGguDQogDQotIEFkZGVkIERUIGNvbXBhdGli
bGUgc3RyaW5nIGZvciBNQVgzMTMzMS4gTUFYMzEzMzEgaXMgY29tcGF0aWJsZSB3aXRoIE1BWDMx
MzM1IHdpdGhvdXQgYW55IGFkZGl0aW9uYWwgZmVhdHVyZXMuDQotIFVwZGF0ZWQgSTJDIGFkZHJl
c3MgZm9yIE1BWDMxMzM1IFJUQyB0byAweDY5LiAoSSB3aWxsIGJlIHJldmVydGluZyB0aGlzIGNo
YW5nZSBhbmQgc2VuZGluZyBhcyBmaXggc2VwYXJhdGVseS4pDQotIEluY2x1ZGVkIHRoZSBhZGRy
ZXNzIDB4NjkgaW4gcHJvcGVydHkgcmVnIGZvciBNQVgzMTMzNS4gKHdpbGwgcmVtb3ZlIHRoaXMg
Y2hhbmdlIGFuZCBpbmNsdWRlIGluIGZpeCkNCg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFBhdml0aHJhVWRheWFrdW1hci1hZGkgPHBhdml0aHJhLnVAYW5hbG9nLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL2FkaSxtYXgzMTMzNS55YW1sICAgICAg
fCAyMg0KPiArKysrKysrKysrKysrKysrKystLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+IA0KPiBXaGF0IGNoYW5nZWQgaGVy
ZSBleGFjdGx5Pw0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3J0Yy9hZGksbWF4MzEzMzUueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3J0Yy9hZGksbWF4MzEzMzUueWFtbA0KPiA+IGluZGV4DQo+ID4NCj4g
MDEyNWNmNjcyN2NjM2Q5ZWIzZTAyNTMyOTk5MDRlZTM2M2VjNDBjYS4uZjI0OTMxM2JjNDg1ZDdh
NjE1NGNlNjg0Nw0KPiAyNmQNCj4gPiA2YTk1MDQwNWVmMGUgMTAwNjQ0DQo+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9hZGksbWF4MzEzMzUueWFtbA0KPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvYWRpLG1heDMxMzM1
LnlhbWwNCj4gPiBAQCAtMTgsMTAgKzE4LDEzIEBAIGFsbE9mOg0KPiA+DQo+ID4gIHByb3BlcnRp
ZXM6DQo+ID4gICAgY29tcGF0aWJsZToNCj4gPiAtICAgIGNvbnN0OiBhZGksbWF4MzEzMzUNCj4g
PiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gYWRpLG1heDMxMzMxDQo+ID4gKyAgICAgIC0gYWRp
LG1heDMxMzM1DQo+ID4NCj4gPiAgICByZWc6DQo+ID4gLSAgICBtYXhJdGVtczogMQ0KPiA+ICsg
ICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZW51bTogWzB4NjgsIDB4NjldDQo+ID4NCj4gPiAgICBp
bnRlcnJ1cHRzOg0KPiA+ICAgICAgbWF4SXRlbXM6IDENCj4gPiBAQCAtNTcsOSArNjAsOSBAQCBl
eGFtcGxlczoNCj4gPiAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiAgICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPg0KPiA+IC0gICAgICAgIHJ0Y0A2OCB7DQo+ID4gKyAg
ICAgICAgcnRjQDY5IHsNCj4gPiAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhZGksbWF4MzEz
MzUiOw0KPiA+IC0gICAgICAgICAgICByZWcgPSA8MHg2OD47DQo+ID4gKyAgICAgICAgICAgIHJl
ZyA9IDwweDY5PjsNCj4gDQo+IFdoeT8gSSBhbHJlYWR5IGFza2VkIGFib3V0IHRoaXMgLSB0aGUg
c2FtZSBxdWVzdGlvbiAiV2h5Ig0KDQpXaGlsZSB0ZXN0aW5nLCBpdCB3YXMgaWRlbnRpZmllZCB0
aGF0IHRoZSBpMmMgYWRkcmVzcyBmb3IgbWF4MzEzMzUgaXMgMHg2OS4gU29ycnksIEkgd2lsbCBy
ZXZlcnQgYW5kIHNlbmQgdGhlIGZpeCBpbiBhIHNlcGFyYXRlIHBhdGNoLg0KDQo+IA0KPiANCj4g
PiAgICAgICAgICAgICAgcGluY3RybC0wID0gPCZydGNfbmludF9waW5zPjsNCj4gPiAgICAgICAg
ICAgICAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmZ3BpbzEgMTYgSVJRX1RZUEVfTEVWRUxfSElH
SD47DQo+ID4gICAgICAgICAgICAgIGF1eC12b2x0YWdlLWNoYXJnZWFibGUgPSA8MT47IEBAIC02
Nyw0ICs3MCwxNSBAQA0KPiA+IGV4YW1wbGVzOg0KPiA+ICAgICAgICAgICAgICBhZGksdGMtZGlv
ZGUgPSAic2Nob3R0a3kiOw0KPiA+ICAgICAgICAgIH07DQo+ID4gICAgICB9Ow0KPiA+ICsgIC0g
fA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2ly
cS5oPg0KPiA+ICsgICAgaTJjIHsNCj4gPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArDQo+ID4gKyAgICAgICAgcnRj
QDY4IHsNCj4gPiArICAgICAgICAgICAgcmVnID0gPDB4Njg+Ow0KPiA+ICsgICAgICAgICAgICBj
b21wYXRpYmxlID0gImFkaSxtYXgzMTMzMSI7DQo+IA0KPiBEcm9wIHRoaXMgZXhhbXBsZSwgbm90
IG5lY2Vzc2FyeS4NCg0KT2ssIEkgd2lsbCByZW1vdmUgYW5kIHNlbmQgaW4gbmV4dCBwYXRjaC4N
Cj4gDQo+ID4gKyAgICAgICAgfTsNCj4gPiArICAgIH07DQo+ID4gIC4uLg0KPiA+DQo+ID4gLS0N
Cj4gPiAyLjI1LjENCj4gPg0K

