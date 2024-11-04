Return-Path: <linux-rtc+bounces-2453-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF4C9BB91B
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 16:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60820B232E9
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 15:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05F51BF81B;
	Mon,  4 Nov 2024 15:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Hg6LC/oz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAE313C827;
	Mon,  4 Nov 2024 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730734659; cv=fail; b=u4ANSkNYhmexdq69B54ZyLQZwTKW3B8/h/kPIWKmJBreYq/O+9RXz7hyr8FBUmM5wcjoAW70QFwlqGNKN7OVe2toB+WTFbk62Xl84e1/G9dixuTPK48kkwljwyU4vDMluFpVwAfduRjO+ec0ZnksUDjZKw0LTvvqEbuNIqr+Vag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730734659; c=relaxed/simple;
	bh=mr67aE4BoaXpn/jXBXNFlL6FlVhWAgMV3X1vP2SvAhI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mcz9UAwFZ1CsJo7BIGjfJwIFNOstTuWYJExh4SfiKCzW5/k4wKXwq2KjDFI9/k7YjW0REub0oDE8z8XFJXX/mA9xFF5hu7Q2DdzI/UVJsf2H2QRbppykmikqD5H2UIUsqOZh8clsFDMK7yHzvWNM5Uk37SBogY9NS6BQQvbEp/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Hg6LC/oz; arc=fail smtp.client-ip=40.107.22.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHleGUaf5Kitc9Tb4MXh/6WKDsaHCUjpyS3Eqnq13pMcUmwVz6XlM5K+WAHRzT1olW9Fk93B5AvNkTPFrmSimdI6HjIJQ/gf8mX86K9hR/lNYjcCA99Mf4oXOkRjafUVvWxOhyUboz4xerftoXaIWme/7+KPUPCM59RYBjKRi3lIa5BKt7twn/RaWE56+DG4D9WzUqHSpmOSrBCRFpW2e2ykkECmZJ341IGVonCzpfvEkWJ4B99DiDNyL2x+cxgypHb5neA+r7otJ0/EUrW4G30xtMP0XWXDxyYk9aQaYPhiwd5zkiEMR8etaRLKQ6LIGAGPEG53jvq7HbwFHahZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cejFWgZjVhNSdf+AtDKV3I2BA47MGCY3F5EHM+rkR8=;
 b=TjPsKJ3FGf8E23xhO2ooehyzF3pT7T7iC03Zt3bHOiFSmH7DpcEnOItR6GhWPPJ/+hln7fE6kE0On4gHIvNMun1qs2j3avBDiN0xfjV/lhepFtandNKMUdKRiBDHjkQ9iDDYXOdz8Y3Fxo1fnUb4vTjzdwVOtvTymMyTM/wqEeMsSYjCKfIocnyD3SzS5vEo1UOzPd3IJ7t5cz30jwyPqYfUndSB3GNDlfrDM8Izw0oKaiSqcK7Nsb2qHtF92J2geM6ZRMWfdonBy0YhS4e0FDcCDg0vc9uc9YCgz/iFEDLmlHqFVimNu43TIWi4HKjKsv21/dAvSKejcJIOpvbj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cejFWgZjVhNSdf+AtDKV3I2BA47MGCY3F5EHM+rkR8=;
 b=Hg6LC/ozKCPLEAUde4hecN/7M263G22Ldx+x/wz0sR2TGyy5Lm24wIjUK3k1rCKvILsAzLD+xxfVCjx37Q6gxRHnZ7ef+PpRuEK8aqbgrO4NEZzlTC2GnYqmam5xGJi4Ei2bWHxVntgOXqXG/I3H1DuHl0Z5WHK54cuAh4dwTsl4E1TiFWyCjitfDzqSSADbLuRjFHZXH7IEnHWO6y4/r/I58BWUoCR79VT03J6EB6f+fOyAArmUH6OhBCh8xMyJgIF4bdqKzorshXTBLhpprrBu8mFPtTVDMTYco1VumHvqxjyJfFyDt7QuD0cmuD/cpG2f5xkOK3Lm7S3R+ae1wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA4PR04MB8061.eurprd04.prod.outlook.com (2603:10a6:102:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 15:37:33 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 15:37:33 +0000
Message-ID: <bb44b481-a1cb-480e-b842-5ca170371feb@oss.nxp.com>
Date: Mon, 4 Nov 2024 17:37:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
To: Rob Herring <robh@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
References: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
 <20241015105133.656360-2-ciprianmarian.costea@oss.nxp.com>
 <20241015211540.GA1968867-robh@kernel.org>
 <20241015212717.GA1983714-robh@kernel.org>
 <20241016160823c22ccb22@mail.local> <20241104152934.GA129622-robh@kernel.org>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20241104152934.GA129622-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::25) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA4PR04MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a326285-dc13-4ff8-7aa3-08dcfce699f1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzdUUkZZYVdpdkt0c0VoMk1tU3lXUXhZbmNjN2gzK3UzRE5Lbk5GcXVrVHor?=
 =?utf-8?B?SnVIUVFad0dUeVlpRlVDTzJBdjRuSHIzY2FLTnV3ZnZTUW9qSTk0aFprY2NP?=
 =?utf-8?B?ZHdYREl1YmprSFdJZ0p5V3NtTFJ5dk5Eb2I5OENkOTNvNklSb2N5K2Qwakta?=
 =?utf-8?B?YzJIRXU5blJtVmxqNkprRis0cFlESGFxWi9RYnJvY0wwaUR3V0JZcWZaM3RB?=
 =?utf-8?B?MlUzaGR4MkorWXNLV0Y4MlpkdzlJaC9zcEZRZ3YzaFJ1RTVaeEpnc3NCRldL?=
 =?utf-8?B?ejd5SC9KYkd2TFZMNEdDVmhCOUlqaVdsVDUrQXozWEhDWXB0bDZic2V5cmFM?=
 =?utf-8?B?aWJ1eWhZRzMxSE5HOVozdldOVFl3SFpMWnN2NVNad1dMWFI3SDlqNkNsRTda?=
 =?utf-8?B?WjBGckV1Nm9qVmFacFd5L1Zuc3ZWTEFKeGJaTTU1WjZYWXArdG03VHpYUEl2?=
 =?utf-8?B?SG5WVGFWeFFmZU00cWpHR0JGb1RmOVNjR0VPN3o2VVRLUXNqeElHdlJMVHFs?=
 =?utf-8?B?S3ViNkJQNVprcGZKVkErK2RILy8zdG1Bamk3MVRlSXZ6YUlIeWR4OFVSZVhJ?=
 =?utf-8?B?WnhiYUxkVnVWRHNaeWJuQWZpQVZPMGFWbXJZY0sxM1RqaHptR0FaTGVvU09L?=
 =?utf-8?B?WFE5V3ZyZHV5ZGRNU0VzWi9ZcWJWSHZDbDRRWUd5UGI0aUxvNitGYTVxVzNh?=
 =?utf-8?B?aExqZlVCTGlJNWRsb0M2QjJES3hsb1N3WmZIbHk5Tm42bkZJNlV5SXVML0lV?=
 =?utf-8?B?ZHRjY0laN3lNazBqbWcrdDRUaWJzNWxNSzVnUndYaC82Y2VMYU9kd0drdWFZ?=
 =?utf-8?B?anE2amI5cTY3UGpiY3hVUWF0blJicHZad3ZKeGpVT1IrYmhvRHUyckRocE5u?=
 =?utf-8?B?YXNHWlRhY2QrZDVWb2w2amR0bHZkeFdVV29KRFZSakZ1dkF4ZFUyZUJOSlI2?=
 =?utf-8?B?N2hINnZtZDdKQUxBU3M4M2NtMjdQb2tISXAvTG5tUlVZV21xRTlIWm9OMGJV?=
 =?utf-8?B?UjZoMEhlai9EOTRIYkV2WkNoYVlLcnRyL1UvUi96U1Q2emtnL0pvQWV6cTVC?=
 =?utf-8?B?U3FMODZGaGk0TDFkR2U5d2dtaHdtMTJNTHM2ZWY5SlptL2IySUJSaUNHb1lL?=
 =?utf-8?B?MzdWYzJiaE5TUml1d25vTm8wQkZid2M5SGpWQlRoYldYQU5ZRzA2T2RqWFdL?=
 =?utf-8?B?YlBWdGVTbHNSclVXRVJtMm5GLy9tYVh2d1pxUktVSTVvTDBqbVNWV3dXbzRv?=
 =?utf-8?B?V1RDZ2kyYk9EOWMybUo0RHVIRDlnZEZ5QkpTZ2c2WFVIMmZ2TGU1cDdvV3VD?=
 =?utf-8?B?bFhKMWZscHdGUHlGZWVlajA3dDI5NXppVlMzMnc3Z3RVM3JrNlM0R0dwblJU?=
 =?utf-8?B?WjNmajlPejhPNVBGMTc1SzF4elZERUE4Z0ltVGZuTlM2YVFjRndDVDlEQXFs?=
 =?utf-8?B?VUg1QnIzUlNseGh6ZzlzWUN5RGo5Mmk5clVYTkptWWhDR0Z0ZlhhWHN4MkNP?=
 =?utf-8?B?VFBaWVVQLzJFZ3F3dUo3UWVJeEd6N3N2QzV4OXl4dGErbXkxS2FlUnBNNjZy?=
 =?utf-8?B?Z1kwaGw0MlZXMkVPNE14MitXNmo2bXdLdTNTNHlVQ3EwTlFsdDNVMUx2WEhN?=
 =?utf-8?B?TWYzZEpPNlBiOWdCU2VFdXI1T1ZxbExHOVJkRHZnV0pFVnRaejVDVUNhYjJR?=
 =?utf-8?B?cklrNEQxaGtCak1tN2Y1SWhZUmJ2WHF3Y3dlNFhFc3paTVRaWFliWFFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3FjNkhIYVJDT2dlWVdCZ2ltQ0RUZVlrMkk2Nk1jaVI4OVBEaC9jeUhLZGxt?=
 =?utf-8?B?d3NkSjZEUU5LWW9yeGpGNUpSdDZZODk5bVV6dTJvWnRPWUtUdkVHSVMrY1Zu?=
 =?utf-8?B?Z3dBU1FwdGFLY1NEcit5QlkrOFdaVE8zMlFHUC82MUVncE5OUGVJTmx2OEho?=
 =?utf-8?B?bnROK0tYelU3WDFkQmpWRVFsc3p2SzRUWnlTS3RxajBDd2hucFFXdWlwb3JN?=
 =?utf-8?B?aXVhR1FiWmI2U2hicnZ6S2tEYUFvZXpVaTRGTkx0cWRvdjJLTldwaUlNSHAy?=
 =?utf-8?B?ZDhWYTFPOFZFTVQ0RVgwVWFpN2M5VHZzeUpGR050d0xxRU1zaENYaXlhQ01q?=
 =?utf-8?B?VTQ2YlZBRkZmODRRMjZBNHVkRHVOSU9NdXNCN1hscHUrd0NNMXJlSTdpY0ZK?=
 =?utf-8?B?akZXTU02eWhlaHpOS0M3QlhqMzVtYjJwL1BHMzRucWRvLzdnRHZ0cEcwN09C?=
 =?utf-8?B?YTBCeHZLOXVTMWNEQnFjRjRnUkhxRGtzK0tGR0JiMkduNHRYeE43alR3TUdW?=
 =?utf-8?B?b2lLeWRZVmt1V2hBMFUyd3p2UllYdlNoa1FFak1oNjhDWkUzSlc1aitYY2Vi?=
 =?utf-8?B?RkJlT0EvQXJjWHpicWw5ekpISFo3VTdhMDVSOXRablhUYmRBN3FRNWg4VkNT?=
 =?utf-8?B?ZTE2blZncjVIVXJSN1E1SDZqWUVFZDRwbFpnNnkvaG8wWDZEK0JxbHVtelFO?=
 =?utf-8?B?b0Y5MDJQL3UvRkRPTG5lZytOclVrZE5RbTM2bG1uTzg1YmZCQWU1eXkrVk83?=
 =?utf-8?B?U0pGSTBUMTNGaVFoU3hCMi9wK3Y2ZEZ6TlQ5M1NxVGgvTEFrbE9MdTloNHRT?=
 =?utf-8?B?bU5Oc1VodGhKYlJTNnpKbmtjVkVtNjN2YjJIVDJGbEREL21FSGlLNnlqbUZl?=
 =?utf-8?B?cCtGWG84YTJmVnRBb0Z4R3puaGZVYVVHSXRxV1ZUbThTQU41RDgxbFRpdWJH?=
 =?utf-8?B?ek43R3IvWFFxTkZjQ3NsaXkrZXZ1eXBobXhzUzI3b0Y2dE5EZVI3NzEzNith?=
 =?utf-8?B?V1pDVUlzcFFQZGprT0NGOGYyc2UySmpsWm1KSnV6bzR1TVhRRmpxYkdqOCtU?=
 =?utf-8?B?VTczTitMeW04clF4RE5RTHc1MzlmTko5MHVqYVU2T0wyVFVza0pmSlZWTUVv?=
 =?utf-8?B?V0lnb21hdU96U05vKzJ2ZnF3RTJmdkltU1JOOUJPOGhNbURvNkxMbnQxM2th?=
 =?utf-8?B?eTlUQmFSNDkyUW9xN2RRRldwdzZlZmdZQmthTWpzbG0wYnFpYitHVTJpd1JX?=
 =?utf-8?B?aXZHN3o4SGVaZVZFa1ppMElrZktobzFaZ1hheGsyTWx5Qi9BeVVYMDJOQkZn?=
 =?utf-8?B?NytQN0Erb3RpRE1lUmlYVmowOEFwczdtQlpTSWF0VExUSHNBcUtzVk9YRzBU?=
 =?utf-8?B?R0lMRTBQQUM5clJaQk8vU1BNb3Rsdk5rZGFuNG5QUys3bWRUMzU0ZTA4UHkr?=
 =?utf-8?B?WEtzSll2TXlLS1RhY01SaW9RSTRjZDM3QnV1ZGVqa0gxTEMvbXVLOWpUbTNS?=
 =?utf-8?B?Um4zcUlkdzN6cWJOTHlzTmxRSHZRaXAwS1JnYk1qWDk3UlMzMFdQQ2pnZnVr?=
 =?utf-8?B?bjI2ajdKWXhkZGtWc3A1T0lISCtlWjFDU1kvYXd2K0pESHlTZHlSRnU2RnhI?=
 =?utf-8?B?V3BKeWNMQjJkQ2M2WmxzK2dPZWI4blFMUjRmamUzSmU1YlEvYzVZNkpqS3Vt?=
 =?utf-8?B?Q05kaXp2RGxnU2FGdVJYOUd3UTVmazRJN0hqbVA0eHJ3ZGZCcUlsUFVTL2Ev?=
 =?utf-8?B?YWErYytkZmFVNVRQSkJzYitMYkpCSGE4dGgwQUhvV2NxbmlXY25kQnk1S010?=
 =?utf-8?B?a1ZMVnB1Y3g1czM5R1RPeERDemZkSzllbWFSS1BTMGQvemZLLzRjS01lZGkr?=
 =?utf-8?B?SCtDMW9BVUs5WDdDRTJWaHg4SDFIbDhFODlaakNJWTE4ejFHdDlTbUtzVlEr?=
 =?utf-8?B?ZEg5Q0xRNVVaanRwd2lNck1UYWZidjI5OTdoS3BYcm9sK0Q4MXhEb1VpTUJN?=
 =?utf-8?B?aldjbUQzUlJ5RmNOajFVODIrTkNqR0diRGl1ZGQwb0tXUjhVenIxRmJ6cWJa?=
 =?utf-8?B?NUM1clljU1FrdWZRaGdtZU02U1BSTmZyeGc0UXlGM0t1dEgvZ01TeVFsakw2?=
 =?utf-8?B?cldKVmpDTE1wWWhWNTBNL2cvNGdacDlwWUlxTE9odjhDZHFmYVc4Yk1JOFB4?=
 =?utf-8?Q?2NDzW7fUR/tw95x6t0xAHSw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a326285-dc13-4ff8-7aa3-08dcfce699f1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 15:37:33.7421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/L2SkykRdZ6m+ismcvUgwbHRiB9Kbd+OAeoYV2+dFeuPqSnW+6TqxsYw1NOtXVfbArIn66ePO7kSc9PxCY8ypH88wrvR84yO6aYfsA8ULI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8061

On 11/4/2024 5:29 PM, Rob Herring wrote:
> On Wed, Oct 16, 2024 at 06:08:23PM +0200, Alexandre Belloni wrote:
>> On 15/10/2024 16:27:17-0500, Rob Herring wrote:
>>> On Tue, Oct 15, 2024 at 04:15:40PM -0500, Rob Herring wrote:
>>>> On Tue, Oct 15, 2024 at 01:51:30PM +0300, Ciprian Costea wrote:
>>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>>
>>>>> This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
>>>>>
>>>>> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>>>>> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>>>>> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>>>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>>>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>> ---
>>>>>   .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 102 ++++++++++++++++++
>>>>>   1 file changed, 102 insertions(+)
>>>>>   create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..3a77d4dd8f3d
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>>>> @@ -0,0 +1,102 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
>>>>> +
>>>>> +maintainers:
>>>>> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>>>>> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    oneOf:
>>>>> +      - enum:
>>>>> +          - nxp,s32g2-rtc
>>>>> +      - items:
>>>>> +          - const: nxp,s32g3-rtc
>>>>> +          - const: nxp,s32g2-rtc
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  "#clock-cells":
>>>>> +    const: 1
>>>>> +
>>>>> +  clocks:
>>>>> +    items:
>>>>> +      - description: ipg clock drives the access to the
>>>>> +          RTC iomapped registers
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: ipg
>>>>> +
>>>>> +  assigned-clocks:
>>>>> +    minItems: 1
>>>>> +    items:
>>>>> +      - description: Runtime clock source. It must be a clock
>>>>> +            source for the RTC module. It will be disabled by hardware
>>>>> +            during Standby/Suspend.
>>>>> +      - description: Standby/Suspend clock source. It is optional
>>>>> +            and can be used in case the RTC will continue ticking during
>>>>> +            platform/system suspend. RTC hardware module contains a
>>>>> +            hardware mux for clock source selection.
>>>>
>>>> If the RTC h/w contains a mux, then your mux inputs should be listed in
>>>> 'clocks', not here.
>>>>
>>>>> +
>>>>> +  assigned-clock-parents:
>>>>> +    description: List of phandles to each parent clock.
>>>>> +
>>>>> +  assigned-clock-rates:
>>>>> +    description: List of frequencies for RTC clock sources.
>>>>> +            RTC module contains 2 hardware divisors which can be
>>>>> +            enabled or not. Hence, available frequencies are the following
>>>>> +            parent_freq, parent_freq / 512, parent_freq / 32 or
>>>>> +            parent_freq / (512 * 32)
>>>>
>>>> In general, assigned-clocks* do not need to be documented and should
>>>> never be required.
>>>>
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - interrupts
>>>>> +  - "#clock-cells"
>>>>> +  - clocks
>>>>> +  - clock-names
>>>>> +  - assigned-clocks
>>>>> +  - assigned-clock-parents
>>>>> +  - assigned-clock-rates
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>>> +
>>>>> +    rtc0: rtc@40060000 {
>>>>> +        compatible = "nxp,s32g3-rtc",
>>>>> +                   "nxp,s32g2-rtc";
>>>>> +        reg = <0x40060000 0x1000>;
>>>>> +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +        #clock-cells = <1>;
>>>>> +        clocks = <&clks 54>;
>>>>> +        clock-names = "ipg";
>>>>> +        /*
>>>>> +         * Configuration of default parent clocks.
>>>>> +         * 'assigned-clocks' 0-3 IDs are Runtime clock sources
>>>>> +         * 4-7 IDs are Suspend/Standby clock sources.
>>>>> +         */
>>>>> +        assigned-clocks = <&rtc0 2>, <&rtc0 4>;
>>>>
>>>> That's weird...
>>>>
>>>>> +        assigned-clock-parents = <&clks 56>, <&clks 55>;
>>>>
>>>> I'd expect these should be in 'clocks'. I don't think this node should
>>>> be a clock provider unless it provides a clock to something outside the
>>>> RTC.
>>>>
>>>> Looks like you are just using assigned-clocks to configure the clock mux
>>>> in the RTC. That's way over complicated. Just define a vendor specific
>>>> property with the mux settings.
>>>
>>> I just read v1 and got told use the clock framework...
>>>
>>> I disagree completely. Tons of h/w blocks have the ability to select
>>> (internal to the block) from multiple clock sources. Making the block a
>>> clock provider to itself is completely pointless and an overkill, and
>>> we *never* do that. Any display controller or audio interface has
>>> mutiple clock sources as just 2 examples.
>>
>> And in 6 months, we are going to learn that the rtc is used to clock the
>> wifi chip or whatever and we are going to need to add everything in the
>> CCF and we will have an unused property that we are going to have to
>> support forever to avoid breaking the ABI. This already happened...
> 
> For that to happen, the RTC needs to have a clock output. AFAICT, from
> the series it doesn't have any clock output. If it does have an output
> clock, then yes, I would agree with you. But I only know as much as what
> is put here about this h/w.
> 
> Rob

Hello Rob,

Thank you for resuming discussion on this patchset.
Indeed, the RTC does not have a clock output.

In the meantime I've sent a V3 where 'assigned-*' entries are no longer 
required.

Please let me know if V3 is headed into the right direction since I 
prefer not to throw away current 'assigned-*' CCF approach since IMHO 
its scalable with the clock source selection for runtime and suspend.

Ciprian


