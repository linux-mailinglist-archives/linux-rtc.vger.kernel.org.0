Return-Path: <linux-rtc+bounces-5910-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZLzECokpe2kJCAIAu9opvQ
	(envelope-from <linux-rtc+bounces-5910-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 10:34:01 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B3CAE2E2
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 10:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B73353004637
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 09:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E49312807;
	Thu, 29 Jan 2026 09:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mAr5bx+r"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012021.outbound.protection.outlook.com [52.101.48.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BA845038;
	Thu, 29 Jan 2026 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679238; cv=fail; b=R0eQAm0oyQobl/8FB+VAKTIVVixbGhDSIuzdlA8BwPRWA6/DjdZbSyZRkRH3xrgkL2ha+cyc73e2RIYVRcalkuBiZJRDivdx9UwnY00APfTwZZDlbyfsLG7phn084rG9abMF1hIsjNHCSj51tfDEfooeghQQWWn/DXMqCEbHmTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679238; c=relaxed/simple;
	bh=kOKytMx4OdR9UuUPcDKMNkw+npv5/iIokrm4Wi7XrKY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i87nvYrl5gp8U0xkhs0de6Zayxgg8xk4TrQcdlp84fwQRsWTUa0vS/JbKM6RH/91iV4IwDCKBdfAxB2h+p5VoZDoNcvCPBy2WwiczOSytjyJ7oaOjJ4AXNzZ5i5o2Q2WW61Ph1n8zq35p6rh4/gke1osVPkJtcZBbJrbByJ07QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mAr5bx+r; arc=fail smtp.client-ip=52.101.48.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cd4/0Qp78hRNBnPDxc6xV+3wR8SzOuwvHfyEa3y10ciMOYrunu9V0uCFX4J0UlHbdG3RHDpc9q0+w9dkt9tPS8INP0d1tepWXRpi4yOh8nGCg3c/K2HtXBwPxxxwCr4UKt9CJvGYWqIrROEeEhLUP8Kricf8U5bfN9e430MP8kyAY+ybTaKuclCXWCJauw6AdAOn82U7jQjdhnlkIN/v8XI1OLTtgENkJnrDVrZPbzxndoIhJ2+VJqZc4i1ch3aGomQXE+dyROzxTCbUWd+cj1t5p9H/wmh0uUCIreHgRK8zKUm+wym+Cv+EmTzAfMlTf3X2y1TaI0eQbRvr2/EcjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOKytMx4OdR9UuUPcDKMNkw+npv5/iIokrm4Wi7XrKY=;
 b=Mpad5Fv1x5O2OqDPCLRW98SgTWHw8+GnKrl+otJMnup80/Ox2TOqDT6IqvOkV/XnoBlGGFSCqYdRf65iqSAD034FtwB4pWs4jiR9MQe7Rx+qQqaAMBGirterDlWejo0VBqTIIESVD0pWS9o9iBAOXfQShDUK+ZUM2IenkzzMElUgj0qOhOcYBbVVXkQW6K3q7UMAhvPjawP/iX8nPr+FwH+XSWupP8JuPJiGbLTaQWLa8/4N1MOH6ri/KDx1D6XNNRRtIJ+vPJ3RDyoZiZBgES2GPsCXwMu7pwhX4If2ee68YIdir5vezDoShQgy9Vd/Yvub086V/IWLqFQbT1PMMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOKytMx4OdR9UuUPcDKMNkw+npv5/iIokrm4Wi7XrKY=;
 b=mAr5bx+rltHphgZVsQddj4N67m9rD9F4cVYYSNAP6oB7qQMak5EM1+0DoVNv2yxP/RYE3vNmEmE+EFVk7wTcEhKZrj/zjJwu1WDnJpSd8X3sEoUojIAIOh4VpthYiujs+P39ETAyaoe+q6IN8zK6Q/8TS2e8p+IA5+hpmTxbGPg=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by CH2PR12MB4072.namprd12.prod.outlook.com (2603:10b6:610:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 09:33:54 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2%6]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 09:33:54 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 4/5] rtc: zynqmp: rework set_offset
Thread-Topic: [PATCH v4 4/5] rtc: zynqmp: rework set_offset
Thread-Index: AQHci6aYJZ6K/6MUJ0uEDgonPqfb0LVo7UAw
Date: Thu, 29 Jan 2026 09:33:54 +0000
Message-ID:
 <LV5PR12MB9804AC59265A166ED698EDCD929EA@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
 <20260122-zynqmp-rtc-updates-v4-4-d4edb966b499@vaisala.com>
In-Reply-To: <20260122-zynqmp-rtc-updates-v4-4-d4edb966b499@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-29T09:33:21.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|CH2PR12MB4072:EE_
x-ms-office365-filtering-correlation-id: 9aae78d5-5b6a-45f6-7942-08de5f198514
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MllvUmduRWRVMHlLYVFlNllQWTh2V2dJd0orSElIUnJadFhMMEVuTWFLZHJO?=
 =?utf-8?B?MEFuMVlCK0RTeStGSzNsWEk0WmVHRzZiSythcGVWRFJkVlJPYmF0VWRweHNo?=
 =?utf-8?B?L28zZFp6aCtSNHF3V2xQQXRJS3RHSlFUOERWTnEyakUzWFFLYlhLRDNCRFZy?=
 =?utf-8?B?TkNhZzQ5NlNkS0gwbS8zQWR4dytXU202NDlzWTAzT2pFMktVUHBiUlJmV3Zy?=
 =?utf-8?B?VTB1N0RQZ0JoVTZnZ2tKTnJ4R2wwRWR1YzMreGN1TENkRHdVdk1hRUZ3WWQv?=
 =?utf-8?B?NXZGbnVHRzlkNHlCdTI2MGZKRGpaV0xDbGhxZFVPMVlOQ2RtKyt2aWc0Qlhy?=
 =?utf-8?B?Q2c0Z0lGZCs4VHFHMEFuRmN3aGExRk4xanNwZ3Z3ck4wQUp0TGUxdlBTeUlv?=
 =?utf-8?B?amhjaUUwSnBlYlV0TzJ6Q3FEeW1kTUhTQlp0UFR4OXRtTmdGTnI0TUVNeUVP?=
 =?utf-8?B?b1FZcXZNdkI5RDdkNGE4RFJ3aE5TK1kwc3A0WlVBY01ZTkd6b3NWNXpVbTU2?=
 =?utf-8?B?b2VaVmR4MGowVVJYS3c2emdxSGJQU1BvMnpMWVIxaGlkQjV3ekhuZDQvR2Ux?=
 =?utf-8?B?NmFvZnhSOGN3Mkt0cmxZTldUNzgxQnRkNXJLQy9tQkduLzFoT1NzVnlQcXZo?=
 =?utf-8?B?QVVCemp1QkRFS0E2TzNFUkE0UEZ5dzB1MjNGM0hpSXpNVmZIRU1XaU9JbnFX?=
 =?utf-8?B?L2hqeWZiSHUrSmppRzFqVC9la2JyNTBNVkdpZE40VmZvaTFiYW4rcnpPdDdT?=
 =?utf-8?B?NjBldlhxUWtucFZtc0RMZVZTWnBhcmpjbnRCQkZxUGt3V2twM3lGQ1g3TDZQ?=
 =?utf-8?B?Q0sxT1NZSCtnMmpLc0c3djVLRjNIU1BwUTU3aUV3aE1Xby9wWWF5TVdzZGNH?=
 =?utf-8?B?ek9mUTZPcmk5bEQwK1M0aktNYnNtTjEwdG1rRHgvK0RRUllQTnAxa1JqNVph?=
 =?utf-8?B?Rmg5S1N4aDNrNTRsWDY3VDlxRDhrYU1yZVpwWXdEdm53SThQNzI0SDc3SnJX?=
 =?utf-8?B?VDE4OXJwUTJQZXEraTFQdjRxUXdJdUswR1drRFptOXdVNzJpaDlUQk1TZTE1?=
 =?utf-8?B?NlpIdHJvS0pMcG1tWVNiWTRDaFovQUczOWRGdTNqT3pidm5lVmpGMXVYQUkw?=
 =?utf-8?B?V2lGaWhubjhkTlRwZXhXOVdiUmh6OUdoejRtS0ZWeGQ3dnl5Tm9ISlpqY0ow?=
 =?utf-8?B?aTh0R0FxZENiZjFUVXdXUHgrajNWRGxRcTBXN052V1Q4bDlRdUdBQlVua3Rp?=
 =?utf-8?B?aHBaM1NYcWZ3dUxYcm1NY0plRGo3ZVU1VEJrVzRyeFp0QXJkUHZnaVY1blI5?=
 =?utf-8?B?VzBROUkzT29OajU3RFNPVzQ1Y2FtVEVZT1NVRUI1YjNicE9uY2FDeXA5Q3JN?=
 =?utf-8?B?QWc3NGJ2b0FObDRQSlVKZlpOeUp3cVlGUTFscnpwZ2kzN0FKMlFxT0tSOXNl?=
 =?utf-8?B?VU0vUGo1VXFtQmM5YkdxYXVmaXdJajloQ0kyYlozV2x5Tmh4cHFOdFpNM2RT?=
 =?utf-8?B?TEtSZ0RwdlJHYTdORkJlVENrT1c3bitTZWQ1R2VNVSsvQUc1bG1ta2VqbHpw?=
 =?utf-8?B?WEl5aGNwS1QwQzRLWld0YjhNSzFTNUplMW9KUlNUVjZ0STF6UkJJSnlOZmFv?=
 =?utf-8?B?TTBYUTYxMEYxNFVBZUx3QnBOcjJiMWtBcjFSUTZ0Y2QyMTRyeFNkcU9YUUdx?=
 =?utf-8?B?QVlIWnNrVlRvWmVCUnpsMS94MTY4WHNhZkZKQnMvaURmMDhrMm51U0FkaFpn?=
 =?utf-8?B?U0VORDFxak55ZTRpQzYwMU1DZmNuL2QrUnA4RzZCS2VUcStGbDZzRit1UGl1?=
 =?utf-8?B?djlib1pvTGZBbGVNcVNmNC9xQ1VLbnNPb2R6YVltL3ZUL01wWGFlSUl2eDh2?=
 =?utf-8?B?UUlLNEdrQnVwM1NxandQNXpjMDZLNVF6Yk1CZUNYdExWZXF4QVJ5b2xnQ3Bx?=
 =?utf-8?B?RmRBR0JIalhFZ3Fqa2FDaTVjdkloTVgxR1lla0JRbEZ1WHBvNFJXTVFMNkh4?=
 =?utf-8?B?Y2Fxa2Z1Qi9wSUVvbXA4aTNsSW91MEE1U0V6cy95cGRIYjhFZGZXRHh1VXFE?=
 =?utf-8?B?OE0rQVNJQ094MTY4elowS0NOdmVzb1Vqc3NzTkk0aGxZTHRJTG9idnlNZ1Nh?=
 =?utf-8?B?K1o2ZkFuK1VkWW02RGZNdDZsM244WnliQkdXWG54YjBLNFJoZGRUeFdXelJM?=
 =?utf-8?Q?PGf0ocTYob/4KoxG3/zumzk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?em8zWXR2a0FkQ2FVbmlXVERIZGdoMFplUDFUWGlnbDRzNFJ2ZWY5ckMrWCtz?=
 =?utf-8?B?TWFtZUw4V0pCRWlGcE85dVZiZGpUNndkaWZ1eW1OY0c4OFAvUzBBakpqY3Qr?=
 =?utf-8?B?VWxRRkMxcDUxd0J3MGIwYm1RaUhrZVJWdGY2ekt4TjdNdXRsbkk5VzZ4ZDZp?=
 =?utf-8?B?aU1qNmZVcUZ1UGpza2pVNFRHNVdLQWVqNWlteFgrbHYvWFNSN2tLcmcrRjNw?=
 =?utf-8?B?UmdWUHJxNlBjbXdwQWxhMjY0d3ZONjR6OEphMVhFemlRQ3VNOUVwazhvNy9G?=
 =?utf-8?B?S0JPZ1JpckExa1huNnpYdFdhV2h0MGdFcDhQT01qelpzbzZKSklHdFFqRUxW?=
 =?utf-8?B?dkJiNElhWjZMVzV5YW1lakZidGE1aENoZXQvTTA3VWZwQkZFdGxJWmFnL1E0?=
 =?utf-8?B?NEZ5L3pMN2xITFFrVmVKS3djOURuWStjUDI1cjM4cVRSaDA2Slk5T3hVZHJI?=
 =?utf-8?B?ZWZ3d3N4d3NiOFF4MVR6aWVDOWhFNnUrUGxSSjM4L2lITzBMVGMwYnFKMFQy?=
 =?utf-8?B?Z0UzWERPUVFpZFdFdUVLUC9zeTQzV2xYaGNXN2ozZU5nTXpFSVRFVTE3NERk?=
 =?utf-8?B?ejdEV1g4RGErMDRzSE9UblFNV3hjc0kvSWdTeDExdU9GSzlnTXFNVEdaWjlD?=
 =?utf-8?B?Q290WTExQ2VaN09jUVBQWUxZdis2K2hvMlBlK0VVdE5BcFBpQWlvRWdyS01C?=
 =?utf-8?B?b000eXJlNW9UdC9TWUFyK3lXdmVxRTFlQVJmZ09UNEx4dkpmcmoyZ0szeWpm?=
 =?utf-8?B?N0VaRkoyeFkreSs1NVZKOEdyMER4K1o2WDBOc2hoSFBaWDBKakNQR0NpTTVY?=
 =?utf-8?B?VThrN2tHR2hVV2NyOGUyTkpZbGY0MjgyM0FQTXhlWUN0K2R5Y0Q5NGErNWVa?=
 =?utf-8?B?VkJacytWRis5SGU5ZktsSkdBei91NzZZRXNBZWZnQjIyT1ZoeHhsTG1UbDRD?=
 =?utf-8?B?UFlBWFVJVVZ6cDJDdDcxTnh5dGhncG9UbGhFc0g0My9iZWd3NURaMlRQNTZH?=
 =?utf-8?B?SzZxcFoxYXV0bVdYRUxlL1V5ZXpLYkQvcFg5T0xFR3JxMTk4Q29OcDFYcjJB?=
 =?utf-8?B?dzM5ejNYc1RzeE9Fd0N3WWVQWHJuV3R4SkVjYXNNdzcvM3BrMEJGMktsamRC?=
 =?utf-8?B?QVRPbFdEMlBJZWhhWC8yYjRQcTBHTXBWb3dZcjFhbndWdFoxM1NyNHl3MlIr?=
 =?utf-8?B?c0JqTHJTdmRVQjM4R0QzejFQT3d4cEtML0YyWDVNcW5ZZ1dMSzZPV052d0I2?=
 =?utf-8?B?NFpTSk9MUEc1R2l4bGh0WnpOMGlJZE9MT3pjRzM3blBhbnFadDl0WTlPUGdC?=
 =?utf-8?B?NmhpRTB2VGlyUmVyVGxxNGswTkRSYWxWazU2Rnh3RVFlSzNxRm9wd29BNmRX?=
 =?utf-8?B?QkZiWGZKbGF0K252eVAvVzVEelYzYW9ZOGNtb2xzMUdDSEQ2eHF0ZWZiOXVP?=
 =?utf-8?B?REgwU1JuQ2IxNXZlTXQzc0VSVkVoMGxTUlVMNmJaby9ONDB4S1lvR01ZTG9U?=
 =?utf-8?B?aFd2bk9oRkQ1eURHQkJMZVY5R3BXS25LZVNwL0p2ODd0VW9ObG5mWElzTWZ3?=
 =?utf-8?B?UVcybW5pS1ZCNm83WkNZd0F4Nm81bDBiakR4UFhmRXVreUFGWERBL0ZucU1m?=
 =?utf-8?B?cmdEQlRqL0FyNEZ0Zmd6ZlhvcmJoYzhIU2RTL0trYk5Bc3hUaHkyazJMNnoz?=
 =?utf-8?B?Tmlvc3dLdHA5VU1Nd0VQOWpUZjF1ZysrTU8zOEFaNjZ2UU1QS2NkbGxsUENo?=
 =?utf-8?B?a0Q4QUphRnJzdTUzYzhEQktlNzVOVDBOMTBNU3pnUXFTVDV6NmpjeWh5NTYz?=
 =?utf-8?B?WEh0cHdOYzJacnNQbkUwalNuOVdscXBWR0RGSnhxV3c1MTZOVnpBZnJVb0E5?=
 =?utf-8?B?MVMwYzdIZ0ZYS2tQckQvN0ZwWnZDaWZQME1FR00vYlpQZjRqL0pocjRFQVVj?=
 =?utf-8?B?NmtsL3NhK3ROc1BNcXBnUUJBeTdWRlRXUFNKMUw5dU5PTkRJNy9aOVFjcEY4?=
 =?utf-8?B?MW9FN3Jzam42eUJxTG1HbG94Z0xqa1NRaFZ5bEhrRWFaZkxrL3RzelRBYXAw?=
 =?utf-8?B?VUt4UUZ3MFVjWTFXQU9nVWJHWVFmQlhDQ1J0UnpjcldHM3JlbkU2NmtzVE91?=
 =?utf-8?B?NnhnNDNSNnlGUkMrbnhWS3YydkRNODRaSFg0R09XcDU3UDY2R0ppSmgwTzZl?=
 =?utf-8?B?WENKWWhiY3FadWRGZG1nU2E4MjhFSXBlMUcvZDE1eGpxSXZ4aDg5UzFTRko5?=
 =?utf-8?B?Zm1sZnNLREM5YjR1KzZiOFZJU1RWbURFMmJ5eU03VlphUFBNUVZPNHpCRFc3?=
 =?utf-8?Q?0bqvh4nZChDelVDoaM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aae78d5-5b6a-45f6-7942-08de5f198514
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 09:33:54.4379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K+CKbOvdgCQMmj/8sMI1ZaEQGYza3bAVeywLHcKm5wmzFITpOjBgTpjs0NNbT0oM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5910-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Harini.T@amd.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,amd.com:email,amd.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,LV5PR12MB9804.namprd12.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 18B3CAE2E2
X-Rspamd-Action: no action

W1B1YmxpY10NCg0KUmV2aWV3ZWQtYnk6IEhhcmluaSBUIDxoYXJpbmkudEBhbWQuY29tPg0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFRvbWFzIE1lbGluIDx0b21hcy5t
ZWxpbkB2YWlzYWxhLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEphbnVhcnkgMjIsIDIwMjYgNzoy
NCBQTQ0KPiBUbzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4u
Y29tPjsgU2ltZWssIE1pY2hhbA0KPiA8bWljaGFsLnNpbWVrQGFtZC5jb20+DQo+IENjOiBsaW51
eC1ydGNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBUb21hcyBNZWxpbiA8dG9tYXMu
bWVsaW5AdmFpc2FsYS5jb20+OyBULCBIYXJpbmkNCj4gPEhhcmluaS5UQGFtZC5jb20+DQo+IFN1
YmplY3Q6IFtQQVRDSCB2NCA0LzVdIHJ0YzogenlucW1wOiByZXdvcmsgc2V0X29mZnNldA0KPg0K
PiBDYXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJj
ZS4gVXNlIHByb3Blcg0KPiBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tp
bmcgbGlua3MsIG9yIHJlc3BvbmRpbmcuDQo+DQo+DQo+IHNldF9vZmZzZXQgd2FzIHVzaW5nIHJl
bWFpbmRlciBvZiBkb19kaXYgYXMgdGlja19tdWx0IHdoaWNoIHJlc3VsdGVkIGluDQo+IHdyb25n
IG9mZnNldC4gQ2FsaWJyYXRpb24gdmFsdWUgYWxzbyBhc3N1bWVkIGJ1aWx0aW4gY2FsaWJyYXRp
b24gZGVmYXVsdC4NCj4gVXBkYXRlIGZyYWN0X29mZnNldCB0byBjb3JyZWN0bHkgY2FsY3VsYXRl
IHRoZSB2YWx1ZSBmb3IgbmVnYXRpdmUgb2Zmc2V0IGFuZA0KPiByZXBsYWNlIHRoZSBmb3IgbG9v
cCB3aXRoIGRpdmlzaW9uLg0KPg0KPiBUZXN0ZWQtYnk6IEhhcmluaSBUIDxoYXJpbmkudEBhbWQu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBUb21hcyBNZWxpbiA8dG9tYXMubWVsaW5AdmFpc2FsYS5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jIHwgMzMgKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KSwgMjAgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtenlu
cW1wLmMgYi9kcml2ZXJzL3J0Yy9ydGMtenlucW1wLmMgaW5kZXgNCj4gYzgyZjRkNDkwZmM3ZWJi
NTg3NmI4MjAxODJmNWU3OWE5OWU0OTZhOC4uZjBmNWRjNjNlMjU0Nzk5ZWQ5OTkyN2MyNQ0KPiA5
Yzc2N2IzMGVlODc3YTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYw0K
PiArKysgYi9kcml2ZXJzL3J0Yy9ydGMtenlucW1wLmMNCj4gQEAgLTIwOCwxMyArMjA4LDEzIEBA
IHN0YXRpYyBpbnQgeGxueF9ydGNfcmVhZF9vZmZzZXQoc3RydWN0IGRldmljZSAqZGV2LA0KPiBs
b25nICpvZmZzZXQpICBzdGF0aWMgaW50IHhsbnhfcnRjX3NldF9vZmZzZXQoc3RydWN0IGRldmlj
ZSAqZGV2LCBsb25nIG9mZnNldCkgIHsNCj4gICAgICAgICBzdHJ1Y3QgeGxueF9ydGNfZGV2ICp4
cnRjZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBs
b25nIHJ0Y19wcGIgPSBSVENfUFBCOw0KPiAtICAgICAgIHVuc2lnbmVkIGludCB0aWNrX211bHQg
PSBkb19kaXYocnRjX3BwYiwgeHJ0Y2Rldi0+ZnJlcSk7DQo+IC0gICAgICAgdW5zaWduZWQgY2hh
ciBmcmFjdF90aWNrID0gMDsNCj4gKyAgICAgICBpbnQgbWF4X3RpY2ssIHRpY2tfbXVsdCwgZnJh
Y3Rfb2Zmc2V0LCBmcmFjdF9wYXJ0Ow0KPiArICAgICAgIGludCBmcmVxID0geHJ0Y2Rldi0+ZnJl
cTsNCj4gICAgICAgICB1bnNpZ25lZCBpbnQgY2FsaWJ2YWw7DQo+IC0gICAgICAgc2hvcnQgaW50
ICBtYXhfdGljazsNCj4gLSAgICAgICBpbnQgZnJhY3Rfb2Zmc2V0Ow0KPiArICAgICAgIGludCBm
cmFjdF9kYXRhID0gMDsNCj4NCj4gKyAgICAgICAvKiBUaWNrIHRvIG9mZnNldCBtdWx0aXBsaWVy
ICovDQo+ICsgICAgICAgdGlja19tdWx0ID0gRElWX1JPVU5EX0NMT1NFU1QoUlRDX1BQQiwgZnJl
cSk7DQo+ICAgICAgICAgaWYgKG9mZnNldCA8IFJUQ19NSU5fT0ZGU0VUIHx8IG9mZnNldCA+IFJU
Q19NQVhfT0ZGU0VUKQ0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FUkFOR0U7DQo+DQo+IEBA
IC0yMjMsMjkgKzIyMywyMiBAQCBzdGF0aWMgaW50IHhsbnhfcnRjX3NldF9vZmZzZXQoc3RydWN0
IGRldmljZSAqZGV2LA0KPiBsb25nIG9mZnNldCkNCj4NCj4gICAgICAgICAvKiBOdW1iZXIgZnJh
Y3Rpb25hbCB0aWNrcyBmb3IgZ2l2ZW4gb2Zmc2V0ICovDQo+ICAgICAgICAgaWYgKGZyYWN0X29m
ZnNldCkgew0KPiAtICAgICAgICAgICAgICAgaWYgKGZyYWN0X29mZnNldCA8IDApIHsNCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgZnJhY3Rfb2Zmc2V0ID0gZnJhY3Rfb2Zmc2V0ICsgdGlja19t
dWx0Ow0KPiArICAgICAgICAgICAgICAgZnJhY3RfcGFydCA9IERJVl9ST1VORF9VUCh0aWNrX211
bHQsIFJUQ19GUl9NQVhfVElDS1MpOw0KPiArICAgICAgICAgICAgICAgZnJhY3RfZGF0YSA9IGZy
YWN0X29mZnNldCAvIGZyYWN0X3BhcnQ7DQo+ICsgICAgICAgICAgICAgICAvKiBTdWJ0cmFjdCBv
bmUgZnJvbSBtYXhfdGljayB3aGlsZSBhZGRpbmcgZnJhY3Rfb2Zmc2V0ICovDQo+ICsgICAgICAg
ICAgICAgICBpZiAoZnJhY3Rfb2Zmc2V0IDwgMCAmJiBmcmFjdF9kYXRhKSB7DQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIG1heF90aWNrLS07DQo+IC0gICAgICAgICAgICAgICB9DQo+IC0gICAg
ICAgICAgICAgICBpZiAoZnJhY3Rfb2Zmc2V0ID4gKHRpY2tfbXVsdCAvIFJUQ19GUl9NQVhfVElD
S1MpKSB7DQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGZvciAoZnJhY3RfdGljayA9IDE7IGZy
YWN0X3RpY2sgPCAxNjsgZnJhY3RfdGljaysrKSB7DQo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKGZyYWN0X29mZnNldCA8PQ0KPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAoZnJhY3RfdGljayAqDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAodGlja19tdWx0IC8gUlRDX0ZSX01BWF9USUNLUykpKQ0KPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgIH0NCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZnJhY3RfZGF0YSArPSBSVENfRlJfTUFY
X1RJQ0tTOw0KPiAgICAgICAgICAgICAgICAgfQ0KPiAgICAgICAgIH0NCj4NCj4gICAgICAgICAv
KiBaeW5xbXAgUlRDIHVzZXMgc2Vjb25kIGFuZCBmcmFjdGlvbmFsIHRpY2sNCj4gICAgICAgICAg
KiBjb3VudGVycyBmb3IgY29tcGVuc2F0aW9uDQo+ICAgICAgICAgICovDQo+IC0gICAgICAgY2Fs
aWJ2YWwgPSBtYXhfdGljayArIFJUQ19DQUxJQl9ERUY7DQo+IC0NCj4gLSAgICAgICBpZiAoZnJh
Y3RfdGljaykNCj4gLSAgICAgICAgICAgICAgIGNhbGlidmFsIHw9IFJUQ19GUl9FTjsNCj4gKyAg
ICAgICBjYWxpYnZhbCA9IG1heF90aWNrICsgZnJlcTsNCj4NCj4gLSAgICAgICBjYWxpYnZhbCB8
PSAoZnJhY3RfdGljayA8PCBSVENfRlJfREFUU0hJRlQpOw0KPiArICAgICAgIGlmIChmcmFjdF9k
YXRhKQ0KPiArICAgICAgICAgICAgICAgY2FsaWJ2YWwgfD0gKFJUQ19GUl9FTiB8IChmcmFjdF9k
YXRhIDw8DQo+ICsgUlRDX0ZSX0RBVFNISUZUKSk7DQo+DQo+ICAgICAgICAgd3JpdGVsKGNhbGli
dmFsLCAoeHJ0Y2Rldi0+cmVnX2Jhc2UgKyBSVENfQ0FMSUJfV1IpKTsNCj4NCj4NCj4gLS0NCj4g
Mi40Ny4zDQoNCg==

