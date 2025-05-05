Return-Path: <linux-rtc+bounces-4027-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E14DAA967D
	for <lists+linux-rtc@lfdr.de>; Mon,  5 May 2025 16:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FF6116342B
	for <lists+linux-rtc@lfdr.de>; Mon,  5 May 2025 14:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE41525D906;
	Mon,  5 May 2025 14:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="vdv7hGRK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60B72701D5
	for <linux-rtc@vger.kernel.org>; Mon,  5 May 2025 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456511; cv=fail; b=SKiacTBkiNWBpH4mROMsQwFEEL1eW5Si+e6aodaoc61nbeNHUS8COD2XQGKr9b0CjxzzZlYXm0fKZCQkpJohbqRVAA6cEsgIW+wWbgR1oVAPLc2nFaKPgMCSH4xzPhYTl5ZsSa6B/hqtGRi7Kie6rbepmqw7MaTeWHtZ4Fhuh80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456511; c=relaxed/simple;
	bh=oPrRiB7+G8CP+sVHWfESaj0QSCVv26qVlOzGaANTl88=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uNhZOip7hFQ7JGapGHWxxMnNSLHLQ7N0Urn66Dg4fq7B98Q1uZsbNHdTxhq27zYe12PtdDyi/vghfHT2G1jKb4G8wgTtW4ks6pTrYYtUlpnR5j/WyEte8i2riFe0BxWc99Kkt71SlQHkFxhTzq7g3NQCcYVSjAlurAjf5WZkTX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=vdv7hGRK; arc=fail smtp.client-ip=40.107.20.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CD73y4M/pVrgrOcUMCMcOWHmn1i4kvq1ctIkgTdYbbPfy3sIBnfnxUDvzXpGrvANXqHMXRzPcoeIxUDz5qk4orE9aEHLC3btXz5njswcMXhGYJqwShSQWfE1EGqOSczA9sy4BlopLSSiPoSFQMjq+15s8qtE2kIICVRIdG9PmB9GOb5+U4CDBmiW/DYZYIIvxaLvIzAjIDZs98dfJqFifWjIZMXZrpBXPPa6u3A/56FjkDG1ncFhiuzZJJSzvnESzRdIpvG9GEBvgQ6iNW8zs3tWwqAniTMlVNYbJBSNYw/fVbKV4MjO/UxGMpkWD98QLnzPFDq+argcXeK33+9A+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPrRiB7+G8CP+sVHWfESaj0QSCVv26qVlOzGaANTl88=;
 b=wo799hW3mwI0GptjtYCbBunCenajw2qS66WFrO1EeWrWGVayFXNLqH4jRsyPfX67MfCk8d9CdJBZaV2cdgwYx9ZH0o2iPMcEpXqznV5a08wu6rPCkmHLn7thmx5abjWEO0F28vmbXXIHdnfFd0uA55/6R1OYK/wrx14wPimgzYhm7tHWmdBnH/fuIsIqLag9U9Z+BIVbRrixxCf2eC+EfNDSvAVHh7ecZYHlYtla7iggZx8Fno4vAzazQGv7yvPimCJyZKMtleyG6R/yP2yWB2eLuwfUP1E53ANnSYlaBO2wWzqc1icgHW1t1aeeDcDfvbl3ohVv7WltYOhSNnbkmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPrRiB7+G8CP+sVHWfESaj0QSCVv26qVlOzGaANTl88=;
 b=vdv7hGRKTDlgWrE/w03tjG5uTIvEnrsEkaL0Dz0VejmRB/NtmuaXGvIT1GHOJfw7wlSX3UEW3t3XL9F8hoZ05YFEKQWg6VKUz/Q3qwO15kM4//MH7bWsEXAVYuJ5uFAeouX74uaXLxmFO7eu4DxIRSI8B8Afr5buIRnM/C0cuZwRUEJFejWjyRdE00DWDcClpY36WMH9FTPSVhdN7eL+w9pMiX2BNHXQiZ4vTbiRBwv2ZdLghpBvlbYkQvdiaYwyLEQ8lqt2lLkWpqLsXTeII22oUySsvkX5m/LS9O9vQ8bB8GAKgN4HTdQNVPn0BuPf9tFn9eOhND/nTY2PlwNiGg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by VI0PR10MB8600.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:213::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Mon, 5 May
 2025 14:48:25 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%5]) with mapi id 15.20.8699.021; Mon, 5 May 2025
 14:48:25 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "Stockmann, Lukas" <lukas.stockmann@siemens.com>, "Freihofer, Adrian"
	<adrian.freihofer@siemens.com>
Subject: [RFC] RTC temperature compensation functionality in core?
Thread-Topic: [RFC] RTC temperature compensation functionality in core?
Thread-Index: AQHbvczBNIDNqhqhSkqJaZEQppA24g==
Date: Mon, 5 May 2025 14:48:25 +0000
Message-ID: <9bde8aded1eb29265ef86f3257cccd6d37f2b6e8.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|VI0PR10MB8600:EE_
x-ms-office365-filtering-correlation-id: fca8e6de-4c0f-42a4-7f0e-08dd8be3e42d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dHhnOFpWWUlJZXRPdU5oVVRiYzJ1WmNkTncyeHEyV3NvK0pSOHZ6cFNaMk8y?=
 =?utf-8?B?cUZyZ25sNVd1UkozbTh0RjRQdzJwOFhYbjdZUXVETVZBdk9IS0dFYm5BcGtD?=
 =?utf-8?B?c2tmMHdmN0lBRWZML1pqckFMNzg0UDE4NkZGT3dOcFhCR2EwWmIxd1JGMy8y?=
 =?utf-8?B?TGd3Q1J6RzNDWk1IK1BMZlpJYzE4RExoM3cxUWZlTFVMcFhwSzhzQTFNZzU0?=
 =?utf-8?B?K1k0RFNnbGdjaXpWT1hFWnZWSEl2Z0NvSmJ1bTdzOGI0WGFHZUdxZnp2bXJU?=
 =?utf-8?B?R3pGWFJLY2NBVWJNY1RZUXZmKzRwNXBhSDZTNGxaZlZ4RjB2d3RCVGMyUzVU?=
 =?utf-8?B?S0c3eno5eUV4bUtQS05ZSVAzY0VwdklCVHhGVmJaN1ZRMGpWVTJsUjhhSWZp?=
 =?utf-8?B?VlJQOFc4ZWJNUmFEdlNLdk5aQkJvb3gxS2JDSDBsaExGZ0lsRUNEVkNkdEFP?=
 =?utf-8?B?dW5Db3FIcHQ3ZzF6ZEx4bDUwWEd4QjNNT0ZiUkFlUTdvNXFFamV3dEJIbHl5?=
 =?utf-8?B?NUl3VCtWYnhDLy9HZjNDZDR1aHF4K2JqcElGSGI3WmRTUmN0dm1YK2c2emFt?=
 =?utf-8?B?VmJZQXJXazVBLzRyQnRpK29DVGFGbGxSNktzdmVBRFl4dXc1ZkhNZ25iQ1Ra?=
 =?utf-8?B?aVV3MWdlRE91aFF5aWxldGwxRWpaUFNrZGlDSmZ5c0oweEp4VXRLSEpNa3E3?=
 =?utf-8?B?UWhZc2pRMVlFaWJwQjVHUE5ULzM0eHZtdlBwbVB4SXR0cmFza2VSYzl4Q0VG?=
 =?utf-8?B?YUxuYWRsN2hkdzc1WTlNRmU2dFpKd1AyUWpPWXFjVlAwMmtIKzJ0Y3B5MDBU?=
 =?utf-8?B?MDBId1dJZ1UzMGZsdEl3d2VNeThxT1luZkhYaEFhUFEzcVNnNWw2ZWpMdFFB?=
 =?utf-8?B?bUlHd0N2emxyZjRIdkFrempkbmpZZ213djVBM0tBTldmQi9qVU50QlNMbkNG?=
 =?utf-8?B?cEw0Y2JKSE9JQncxN3VjK2pqamg2Q2p5NjMrQkYwVUhZVWdaNWsvRGYvWWlu?=
 =?utf-8?B?UXkrS2IvRjlRNWNLNFFtOUNIVmV0cXRZZWVCTi9HYVU0ckZiOXNSYWkxTXdM?=
 =?utf-8?B?eGZzMUloMnZ4dDluRWE1NWRlejVVTXFFYlk2ZE0yRjdRU2ZRamhaOEh5eW9F?=
 =?utf-8?B?RUFqaHA3NWQrMjIxM3N4ektKRS9YNlJXei9VUnQ3RnJhakk2YnNobEhHenZ3?=
 =?utf-8?B?cnVDRnpvb3JkZVNYYlAydkZUc2dGR2E2YzFzN0Y0YXBlWUtTSEFhVUJjUGRV?=
 =?utf-8?B?SnB0MXhrY3dLNHV5UFovclVVaHRmSExJaUkwK0Z4K1BHTy9Kb3ZlRXpVaCtE?=
 =?utf-8?B?Z0xIUzRuZmdZOXIrYUhUNFI3bllla3RqTks5T0x3eHlYMGFaV0tVaFdjL3da?=
 =?utf-8?B?T2xWMHNqSzA1Mjc1L1Z6R2hmbkhTNjFtd0g0TkR5U0E0c011UkprS1R0ZUJY?=
 =?utf-8?B?ZzdoL2dlQTBhL0c5cWhBNmV2Y2I2ZWhla0w2NlNrREpFYUtpT0FjbTdqb1ht?=
 =?utf-8?B?NVFUVUY5VHVCaUt5d0lNZHFCMXF4ZWhFQ21iUHp1V1VsTlozZzY5QkxvcVBk?=
 =?utf-8?B?bGJBcHAxWjBkMmNJM25pM1Y3UFNSVHVYVzc3NzBiT095SXZiY29EK3hhOERN?=
 =?utf-8?B?cHdWTGJwbVBzNC8yWXlQSVNnNG1YM2EzZzRyZFVublNuUTJwVzl2Z1JGaTZL?=
 =?utf-8?B?aEhhUkd3bEF6QUpRTUc2R0o4TzJMVjRmZmdwcDZhNHluUlpkcmVzcU1YZzFU?=
 =?utf-8?B?SnB3OHhFMW5Uc0pvMDFtY3U1MXlQR1NPdkdpd2RlVWZUNXhSUmx3bmRYdEM1?=
 =?utf-8?B?QjhDdW8vWDNGQnRrYkdVdUZKMllJWHZINFdLWVU1b3JWVFpXVm1hN3YrRE1a?=
 =?utf-8?B?TnJsLzc2aWsveENTWTN3aVhnRHBmZVJlYXY3dnVPS2w4VDhtbHhMLzFXTVVW?=
 =?utf-8?Q?3EsviW7l/dE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGYvUEZ1SGFsTHNkUExhZ3lQTkVoc3JwaUNUeW1DSE15dFVqalhIVmdFTHg1?=
 =?utf-8?B?WHg4bWNkSWkybG5keDBxTUUrcU1Bb2lsN2hMWXBFTUY5M2VYSGhweEhGREIx?=
 =?utf-8?B?bEJOczJTdU5NR1dHbHhWR1dzS252cFVaTUlCM1BrK3dPcUkyMGxhOXNPK2cy?=
 =?utf-8?B?aVNnUTF5Z0V3ajZhUGdza0xRNkNVR3Q2eHI5NXU4dHpWL3NUVHhBYVRGeHM1?=
 =?utf-8?B?cHZoeGJZOHJ4ODhJTlR4eTJ1dUpFODRrbnlhZXREaEpCUHlMNzZHM05WVm5v?=
 =?utf-8?B?V3BGb1BOYTdBZ3VkNW9oZ05FMzBoRlU3UzFJckFHWlpMaEhHd3RxQzB4a3ps?=
 =?utf-8?B?TEo3cS9zUUpJM01ocmgzMC9mQWZ2NDBFV2ViS3VUQUFTQ1U5bXFLcUt1eE9n?=
 =?utf-8?B?bXBhRVZZSUppbU9PQW5aaEx1bHczK0Nlc0dValYwUEdNcDlVNW9EYVBOODRR?=
 =?utf-8?B?NGYvZGpMTEI2ejMzUTg2TUFvNFBERzB6TDBRY054TWZ5NmVZTkdTMHhJeG9i?=
 =?utf-8?B?TW1xTkxQMjRiSkhDbC95MnNZcGY1R2MxVmR5VVpGMmsxN081QnpjczNzSEFT?=
 =?utf-8?B?enA3dktzYVVQS21VUWR4VFpza2k0ZE0rMWp1NTBSSlNVM0NyRzdFOFNKWTZw?=
 =?utf-8?B?cE9CN005TnJVbGdZVngxQTVtNGhUblhYY2crbVo2eGxKRjdkYkpqeStQR2pj?=
 =?utf-8?B?U2RTY0ZIL0t2dW9JYXZOZGRpMVdoOEY5MGpuc2JjRy94cTZLMTA1SjAxMGhP?=
 =?utf-8?B?SVdZY3R3QXhIUzFUZ1hGTmV2bXZqWER6MGk2Z1J4bjEvNFcvYmR5ZkJiSVky?=
 =?utf-8?B?VlQ1WmJjdEJMTElrWUxkY2E4T0ZBYURmTVQyV1haL3hKUHgyRGhnUVlYTkFZ?=
 =?utf-8?B?TzA2TUFySlAvRkV2amZ2cnZtNit5RU42R0ZLUVRudlBGNjZVZVp5R3dxS1Zz?=
 =?utf-8?B?V09uU21qU3N6VXFsejZacHN0OEs0YWVQRkFldVdZQS9UakhBbmhaWHkrS0d3?=
 =?utf-8?B?OVFRWEU5RmpkZ216UHVGNkJ1OGxqUXZaRUk4RWlDM3pwUzcvYVhwSGtyWnZn?=
 =?utf-8?B?aHhtTGZ2TEtrYXFoOTUzVU5MeXBRdzFlSVRQcGIyWUdBTE5KUHJzbllqVUFN?=
 =?utf-8?B?d1lOMitSbUFtRlY5em5ENjloYzJNOE80c1NOaVEyN1Boa0pYNVZEUXJOaklp?=
 =?utf-8?B?RC92RTd1cXBLUGxBUkNKalJXOWM3a3h6RUh1WmJMaXVRd2NQOHhGamJyZGZo?=
 =?utf-8?B?UURrV2xSdnJMWWxLR3FuVGdROXpJd1ZXdnZCWGFCdkg4bHBHbTN1b3Fjbm15?=
 =?utf-8?B?ajFIMkhSZjNMbGdPTThzSm5UdktLMTB5UzlWQ3ZVR0xDTWluUkorbUd6aFNm?=
 =?utf-8?B?NnlxaDY2Rk9HcytIWXhBNVBvdXZmQ1RsYktqTXUwcXJRUlhlYUFRazVzY0Y3?=
 =?utf-8?B?dTRMRWpXZUVncUE2OFdpWjZTY1ZVeW8zaHA1a3B3RzBBMzVrbTU1cW5jLzlE?=
 =?utf-8?B?T0tqa3cyaUErdzN3eW14c25PUzlaRldjeFVZRHpDeFQ0YUs4Vy9aQjFueFlY?=
 =?utf-8?B?UFlQejlZR1orMzFIZjE4UWdoNVVPc0IzeWd5bVhSVGNqV05xMDFYWGxMVnIv?=
 =?utf-8?B?VVpxUFlaMUdXem12ZnZkckRzUkVnTjZIMzk4VGdLbXBDMjZkb0JDR0IvSDJV?=
 =?utf-8?B?akdTOXI4bGJhZVhMVFF4Z29UUi9UTnMzeElLdzlUWjJ2QWRSRGROc2I5b2dD?=
 =?utf-8?B?V3RxWnRoY25RdmViM2ltNnJTNjk4WG9iWi9UdFN1c3haZFlocmlMZm0yanpC?=
 =?utf-8?B?bHFrRHpjSXJXc2xrY1Urd3VaY2RhQm1xdDlJcEhKb1JST3k5cEtzcnpDWHl4?=
 =?utf-8?B?UGZYQ2RlT0s1TG5FQTdVOGxKRjVHc3JreDFqcFpNcVNCYVFKeDFFeHNSYzR3?=
 =?utf-8?B?d2VVak9OSG81TXJNeW8xOVNDTEJydVlYQzA1RDlOb3NwTGhzN3MrRnRKZVFi?=
 =?utf-8?B?bWwrczViRkpxcmozd0x1S3RJSnQ2OUJIbGdCUFR5VXNoczVGM3lIU3pOQmFJ?=
 =?utf-8?B?R2tXemllekZ4czNQdWQydEtLb1J3WE50Sk91MnpqT0FibUg1NW1TZ2krM3hz?=
 =?utf-8?B?VGVtTU9xdW5VQnhpNjI4UEhYVXVyU3FFR2xjZlRRWUtYR1hPcmFzcmFzQnhH?=
 =?utf-8?Q?wTVjtnDEAxPUC1Ydg267aEk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7154FBD18A039048BA36FF4314E9437C@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fca8e6de-4c0f-42a4-7f0e-08dd8be3e42d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 14:48:25.8037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TZHZPMfnJt4csjytlcRaPggcYi5HSEKSvpczAQYCDXX5x2VJEIzyrh8oNASJt/k4BUFdNyofdHxVoXRfnlndJYeSwkriShqCkrGyf5LCu78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8600

RGVhciBSVEMgbWFpbnRhaW5lcnMhDQoNCkl0IGhhcyBiZWVuIHJvdWdobHkgOSB5ZWFycyB0aGF0
ICJvZmZzZXQiIGFkanVzdG1lbnQgZnVuY3Rpb25hbGl0eQ0KaGFzIGJlZW4gaW50cm9kdWNlZCB0
byB0aGUgUlRDIGNvcmUgWzFdIGFuZCBzZWxlY3RlZCBkcml2ZXJzLg0KV2hpbGUgdGhlcmUgaXMg
Y29ycmVzcG9uZGluZyBpb2N0bCAoUlRDX1BBUkFNX1NFVC9SVENfUEFSQU1fQ09SUkVDVElPTiks
DQp1c2Vyc3BhY2UgbWVyZWx5ICJzdXBwb3J0cyIgdGhlIEFQSSAoZS5nLiBod2Nsb2NrIHV0aWxp
dHkpLCBidXQgdGhhdCdzDQpiYXNpY2FsbHkgaXQsIEkgd2Fzbid0IGFibGUgdG8gZmluZCBhbnkg
ZXhpc3RpbmcgZnJhbWV3b3JrIG9yIGRhZW1vbg0KYXJvdW5kIGl0LiAgDQoNCldlIGhhdmUgYSB1
c2VjYXNlIGZvciB0aGUgYWJvdmUgIm9mZnNldCIgZnVuY3Rpb25hbGl0eSwgd2hpY2ggd2lsbCBi
b3RoDQppbmNsdWRlIHByb2R1Y3Rpb24tdGltZSBjYWxpYnJhdGlvbiBhcyB3ZWxsIGFzIHRlbXBl
cmF0dXJlLWJhc2VkIHJ1bi10aW1lDQpjb21wZW5zYXRpb24uDQoNCkkgd2FzIHRoaW5raW5nIGFi
b3V0IGludGVncmF0aW5nIHRoaXMgZnVuY3Rpb25hbGl0eSBpbnRvIFJUQyBjb3JlIHNpbWlsYXIg
dG8NCnRoZXJtYWwtem9uZXMgYW5kIGNvb2xpbmcgZGV2aWNlcyBbMl0sIGFuZCBpbnRyb2R1Y2lu
ZyBuZXcgRFQgYmluZGluZ3MgZm9yOg0KLSBzdGF0aWMgIm9mZnNldCIgY2FsaWJyYXRpb24NCi0g
dGVtcGVyYXR1cmUgY29lZmZpY2llbnQNCi0gc3Vic2V0IG9mIHByb3BlcnRpZXMgYm9ycm93ZWQg
ZnJvbSB0aGVybWFsLXpvbmVzOg0KICAtIHBvbGxpbmctZGVsYXkNCiAgLSB0aGVybWFsLXNlbnNv
cnMNCg0KV2hhdCBhcmUgeW91ciB0aG91Z2h0cyBvbiB0aGlzPyBJcyB0aGVyZSBhIHBsYWNlIGZv
ciBzdWNoIGZ1bmN0aW9uYWxpdHkNCmluIHRoZSBSVEMgY29yZT8NCg0KWzFdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDE2MDEyNjE2MDAzMS5HQTI1NTk3QHBpb3V0Lm5ldC9ULw0KWzJd
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3RoZXJtYWwtem9uZXMu
eWFtbA0KDQotLSANCkFsZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMu
Y29tDQo=

