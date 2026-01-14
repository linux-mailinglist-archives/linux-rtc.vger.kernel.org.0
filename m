Return-Path: <linux-rtc+bounces-5755-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C55D1FECE
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 16:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06BA830248BC
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 15:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC6E395265;
	Wed, 14 Jan 2026 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mKowNcRL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013022.outbound.protection.outlook.com [40.93.196.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1720A1850A4;
	Wed, 14 Jan 2026 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405482; cv=fail; b=m8MPApo6Ap/2T3bwxWloKY3R1VqR28C7zajOa5ICcujixbheOM/rlFlAf6WL1hp/oJhA+CnIKJ+rpBfYEvPLzDK/NkZ2gxPgL2mfiLtjMxp/UGwfB0mNmuovA2eDSPNVGSXd4rMszynROrro0jXt+7IaUkt5qR1XANygAsU+xnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405482; c=relaxed/simple;
	bh=qdqgEfaHmqT5fAsLGNf8KUeMKL0bo6m7vPYs392KW0g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tptq1FjCMl4ZuDh5EzSL1zKE9R/+q0IVbsfKrRioL+qjUhFqzsmqJirmsTTyF36DBF9Kga5iXObYNq8/yLYAEk/H1ZzJKhpdhuLImHiM2URqX8NGdsfEyxH3XYa5GQkaMB9IQI1pjdGLsf38yokv3GK/M+AfAMfzXUd4K4edhLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mKowNcRL; arc=fail smtp.client-ip=40.93.196.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lA+qcsyH2DaQ6TdCNwoQP6ADllTORaJOMrVFD333ap2WCOk0yjNZJo3t7ZcPYb2YzTMproncnk/W9ww1/jQmPGl6o9DUYcg/vsiOmWiyo4/0DoAwcl68fp1Siyw6pmGBStx6rIR3vxlOgVQGLSxjzYGbhdVKDoYT5Wpc0lYN6VJ7rN8hn1hZxKmdhmvafi2GhXMILpIx1KjP0Mf+lbMG1t6Zh2YFlmtsPwv0dMmLJT2m2ciSr4vzHLKhOGZFAWiik9lgvGaJ5DuW8j5gysGCpyiA2pHYwkVOJqwL6KGtl/PFjt7YS6Kn6IsAPy5oflywBxRIs77+annLMAiruU3BcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdqgEfaHmqT5fAsLGNf8KUeMKL0bo6m7vPYs392KW0g=;
 b=W93t5qSLv54I1SEVvkHsNV4xEJbmcIxCmy20RDU9HpebK9d3RdbmSlI3FMVjd+7pooN8jHku3zGlpSLjq4z+bj72HofmSrUv2MBguZYQB271Y7EMrlDXBAiXYdiCJU+Y4W1fgPelBMGne1kMpAF5/fWjWdB7vSxvTLdk492glOsK7HFNnU0PT80kfpgko9zIMRNHvqBtSfBMmJtK9oEGa8LlCbBkHwU19NXWR3hKy5HinTvDpM3Xywe39lNDdzs+8qYRMyCGJEeXsFbyDgvFsKvkMzU1DnkNY5G978D9z0dOmZDv9ramObfqrJMRtz+vZoRUCLYpk49mMoAVAmJchg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdqgEfaHmqT5fAsLGNf8KUeMKL0bo6m7vPYs392KW0g=;
 b=mKowNcRLvbjX0/59zlcDsRou77HUp9gfZ/yEJFtNLfKtDzGNipNPJX15UG+W8I9AV31uky7NfZJJS3luhJ3UFFqOU+zrxl37LIy9G2lwEDo2FrgI7C1rkLkTuPu2y6+2mFvMR5q/Vzy7m/tNF1ATI+elUETPqIce2yRdHXll9kM=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by LV3PR12MB9235.namprd12.prod.outlook.com (2603:10b6:408:1a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 15:44:38 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2%3]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 15:44:38 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 0/5] rtc: zynqmp: fixes for read and set offset
Thread-Topic: [PATCH v2 0/5] rtc: zynqmp: fixes for read and set offset
Thread-Index: AQHcgKf16f71UH6o5k66WWRlRWCLt7VR1xyA
Date: Wed, 14 Jan 2026 15:44:37 +0000
Message-ID:
 <LV5PR12MB9804F0A8A3BF51D2821C1ED1928FA@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
In-Reply-To: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-14T15:41:22.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|LV3PR12MB9235:EE_
x-ms-office365-filtering-correlation-id: 9655f04f-4bca-4f34-d86b-08de5383d30e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?U0NkMk1PT2phZTMwOFlDRzRrd1BBME5xZGdoSDRGVERYbWl5VVN6V0ZOV0pi?=
 =?utf-8?B?SlRNcXN1RE1LbTd1NEU5VUxCaEFkZHhKZ002NENZWkFzZTJUZkRVREdmTVU0?=
 =?utf-8?B?L2d1ampEamJVTDIvQ3R3azlsZVMzUHlmNHZ5a3ZxZS9qM1Rrd2ovQnhPR2tt?=
 =?utf-8?B?THlVRFlDcGJYYkFVMU5Qb2c2Vk1naGJPWXp0VFRyWmw4MG5PSVJqM01tK3FY?=
 =?utf-8?B?Y3UzakVrZko4Q3BhU3gzdHlSemt6M0xFTzBkaURadVp1aHg5dURtR1Z1T0hX?=
 =?utf-8?B?Z3Q5MytNRVdFcGxTY3U5dHlhQ0FjeEx1U3JJZHRPbENUeVZ0NmxWRXdyVnZ6?=
 =?utf-8?B?c3BYZ0NyeXNPai8vNk53clRrUTVaS1lHUThxTXVpajB1NU5EMlQxTm9HZ3Mx?=
 =?utf-8?B?Tmdady93N3ZKako0bzBTQ0IwcDBWb2NvN1drSzlsRFltbkE0VTE4OUh1dWlw?=
 =?utf-8?B?S1BseTZ5Vm1DcDhob1JFUitWRVQ1VHQ3NUNmNEdWSmdCNnBXaGRuQmdSZ2dw?=
 =?utf-8?B?RFNVYWx0NDZiMjBQU0dGN1FKY3liUTVVS0ROMDFmTSs5NG5kN080VmtEY25W?=
 =?utf-8?B?Wk9hdkF6Z1hpbmg3WHo3aTJBL0c2MmJ4NWFpV3FZT09WdFRONGpzKzlVa256?=
 =?utf-8?B?QUpOaUFBWlJwSU9BMzJ5bVBVbWk0TFNQTjBzVzRLRVdnZWNRVFhBdEFJRVJw?=
 =?utf-8?B?bWoyY2FGOXZwTWx5Q1U0ZTZ6Rjg0Qlp4eWlOYy9sVTFPa0hIc1hrbExEbUtu?=
 =?utf-8?B?QnZia0V6OVlIaUpoUVVOSjNRcDZqSnU1d0FZS0ZCbEhwSU1yN0NSQUdvd3p2?=
 =?utf-8?B?WGVuQzc1c0w3TStsYThTVFQrMXFSK1pFSm5VMnE2MHFBSkhoVmtCNXVlZjZP?=
 =?utf-8?B?Ym9kNFg3UEl5MWkzSk5oN3R3ZmpPaVQvT2ZSV3UrM0NhK1p2UTljalJ0NWE0?=
 =?utf-8?B?M2JCWW5OZGk0aFRjT1cwTE00RUozL1V1UzdFbEg1RUdTVDBNVGZKVWNvV3dY?=
 =?utf-8?B?dU1wOVlWam5DWHRFVzdaaXc2ZThMS1RNVWQvL2oyRGR4a3pRTkZVR1ZvL1RV?=
 =?utf-8?B?U3B6d3JsM08vR2xLUWZCdmFHdjNRblREMW9pU2lrUnBvUUhaOFZOTnZmYWUz?=
 =?utf-8?B?S2NXR2w3eFpLQjF6OVJJMjkxOXR4RzhlODZiR0d2aTk5VlJVV3FhelZyaVpZ?=
 =?utf-8?B?ZkdJZThrTU9qczIvbng1RlJ6dzlIWFprOUdORmhIQlZVK2ZscU13YkNVYU4x?=
 =?utf-8?B?Q3FOV291aEdIajk4RklncGYxUWMwd0hLcnNhWTRQaFRhVWV1MjMzditkUHls?=
 =?utf-8?B?R2xqU2N5TEhpUVlSeHJnZVNsSmk1dmhLWnJQNnZxSGUzWEZUMlQrUUhOMXp1?=
 =?utf-8?B?WUU1QXNZSlZrTnJCdmlEQm92S09qbnErb2VOK0Fsd2pudWJibzR3M09ZMXlB?=
 =?utf-8?B?dTZMR1dScVVuV0l1TCt1b253cCtESGFKQmFva2UrZWt1bnVrYzllZHJESUdR?=
 =?utf-8?B?U1NhZUM2Rk1VdDA3Mnc4TndGdVZYT3VnTWpISUNXS2FsZXJjQThqRGJidVYv?=
 =?utf-8?B?STZwVWJzM09MRzl1NG5kdDA4RmJNL3FEdWxVb0tGWm13NWVkR3RVOU1uWXE0?=
 =?utf-8?B?Uzl2d3k5WXgvOEsrU0Q2VU1HMVMzSW8vb3RsNGhCQ08yUWxDYjliVTAwRHJ2?=
 =?utf-8?B?eXlySVlieWx6anBGOGplZUlEa1oxd2toeEdQb2xjdFkwcXV6L3dFTWhhdHB5?=
 =?utf-8?B?cUpia3ZzWThEZ3hNQ3R0QXByVmxlcVJmQkRWR1dJdjJ3MW1aZkFyazJpTGNr?=
 =?utf-8?B?QjhJWlUvTHhqRjYzaThQWlBmZm9keHdMMU96a1F5cDVMMEQvM1Z1K0dsZk1o?=
 =?utf-8?B?VHdyUEN2OCttQnBoYldjQzFuSzVjbCthc1ozSXFYSTRjN1ljb1I3YWZBNnVX?=
 =?utf-8?B?UWtnTmU5UDNOSlovZHNiTGhackhuSm9ycTZ5aTZxQldWTVhEY2pNclBkcWhT?=
 =?utf-8?B?WnU5L1dkYkJvUHhjdlFtL2FOdmFqVE54SGJKWXhVTnlPTXlEMXNiZm9CbFZT?=
 =?utf-8?B?VHFPZWFGenIrUDF6REpiTzNINlpSbjM4Sy8wS01zVjR4bjIyN3ptUUs3SUlK?=
 =?utf-8?B?aGFFSjJMMVdaOHkyaHpLaEdxTDVia3k4bEc3VGx1NkQzSm10RmxyR0hLU05E?=
 =?utf-8?Q?1VOhSLVTR+VM85nYLevpJGt63vQTxKX7Yow6yu9HCWmq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ODlOOWY1Vmc5UmlqcE5vb1BnNE1BSWYxdjR2b2kyNGdJaWE0MHVMdTJIODYw?=
 =?utf-8?B?eHBQNmdWMHRhc1RIZ29yb3hONzNJVnhyVmk0SWxhdmp6Y3VhVlIyK3dNcXg3?=
 =?utf-8?B?bkZObk1iYmU4azVtbGJHdzVnZFZmV256M1RKUlJXRU5qNUxKUzNjUVhlUHp2?=
 =?utf-8?B?aHc3RUVSbFJ5Uzg2bXdZWXl6czhRRVFCZlhremYyYkFrQzROZlQrUlZSRHU5?=
 =?utf-8?B?cWxtK3gwbU5WUzlyTklOT09yUnArWDJvUGxtdGt3SU9hVC9KN2ZHK1U5MW5p?=
 =?utf-8?B?ZWZVVk4veFR4UE53T28xUDZBaHRVTTFMUnRmK0VGU2xYMlV4VnJEK0F1TzJN?=
 =?utf-8?B?QU54WWJveEt4MW5pMDZ5SVVCdU5iakZya2NMUzd4aEpZRExNSERZaHBZcUNQ?=
 =?utf-8?B?Q1J4Yy9MejMvazBBQXlnTk5HeXhlQ05OYjkzcW92aktkNkc0MlhYcEVRMmN1?=
 =?utf-8?B?b0k4R25lcEZoTTA4TVlhT2dlK2VQNzNwREhyVkt3UUx3THB3ZjFtbGRidmND?=
 =?utf-8?B?N2F1cFROZ1FvZi9oVnJaREFBV3pFTWt5a2pLS0pMY2JrVUxkak85SStwWndm?=
 =?utf-8?B?N3gwWS9pcHVMbzBUTmJTR0pOSWpmNzIxeEwyTk1SYkZWdnV3UWpGbHRJVTQ3?=
 =?utf-8?B?T1o5TXN1YTBtSEFxVElHL1Z4dUxGdm5iakJ2TmM5OXRzVE55Z3hFaWFlV2Rv?=
 =?utf-8?B?QzRoSngwZldNV2QxYUIrREU4TlVwZnd3WE43bXQxRHY4dDdnT0NwUkZndDdU?=
 =?utf-8?B?NzZHTy9kTFpyYUNnTUl2RW12UUtGWHJ2UFhPZ0Y2ZjJqYVAyV3E2VlcvQUNk?=
 =?utf-8?B?K3IvaVQ1WWgxZEE2WDVlMVR3alg4M25EalBEbDlEQ2M3QzBGVnJ2Wk9FZmhn?=
 =?utf-8?B?OEx0S01HM0VINEl1SmxYRWkyaVVPbE41NEl5SW9vcmNWUDg5YmtNeEUxT0pj?=
 =?utf-8?B?V2FsSXpBZTJQM2JGWDZaUTlrSGZaamhiNEhoUEhYRml0VzRtZVR4cW9pSXZ2?=
 =?utf-8?B?Vm5ScVg5dWtsQjRGcE90SFNMd2tvTGh0L3VJSlJ3WG5oaUQ2MFBoaFkzMHg0?=
 =?utf-8?B?V2kwTUNGcklQQkZGZ04rMjROU0xBV0FxWmczT3ppQ0o5T3VpQ29GWGJKVU5t?=
 =?utf-8?B?ZDkvY1BYYXozR3pueTkrcW01T3VIKzQvdGRnRGZDMFh6elFkdDZKTGUxS2wx?=
 =?utf-8?B?dktEQWhsMDhudUJpU0VNT0Z3Tlg1UlNVU3pMSEJyZ1o5WXRRTU9ycGhWOG02?=
 =?utf-8?B?U1kxNmxaVm1tOTJSSTBnTFJ4YkFTRHFtZHVvNDNwdXpOeUVCamREb25tWms2?=
 =?utf-8?B?RnVPL2xSdzRJb0dqN3BvMVVBc29Rc3I4Qm1yNUd6bVFoYnBVajhLUlZSdG5S?=
 =?utf-8?B?VmsyNlQ3aWpHMVJ1dmRvWUFiWTdsZ0lXUS9vNW5lQ3NLMmtRcjdPaDY3YWVv?=
 =?utf-8?B?ckdZUnMvMjNqemg5TTFGbkFZZStIZlQzQzYwRE1JRmpudllPTzlnTk1lem1w?=
 =?utf-8?B?Q1J3SUdERDFpTzJtaGg5TWdtUVJwSWZybEhWQWpSM3BOc2M3elFpK2pwNUNm?=
 =?utf-8?B?bitEUDVmbEFlQ0diR0ZCRkJ4UERkay9uUTFZaFAxVzBzQ28rSkZWbjRaRGJV?=
 =?utf-8?B?YW8vcFEvWGpDSW0wVFJGVFFmOFZBanhzbzdOV2d6UmZNYmQ2aVU5allnTVhp?=
 =?utf-8?B?U2VCcDNHdU5kZ3JqelVKZXg2ZHJReVpVamNFbDdYcWpCQWdoTGZ1MmhLZGZY?=
 =?utf-8?B?N3h0ZU1ocnQ4dWlCREtWdE1lZDlrc25PcXlCMWZFM3drUDU4elJXSWsxR00x?=
 =?utf-8?B?bGlBcU44NWJxeTVxN0dnbXlFYXJtQk8xTmhLRS9TckVqKzVNdGppTVh1UWFa?=
 =?utf-8?B?alllUWNzTGw4NFByWGFyTm1MSElFZElVTDFBZHZuaWpQQXRKd2FjY2lMcm1h?=
 =?utf-8?B?NjRNWjZqdmhCRzRmZVY0ZjFMeXdLQi9ZVkEzNUhiZkNib0psY1ErcjVqN2E3?=
 =?utf-8?B?MUpZM055cER3Z2l1eWpqWUxtVkhmK1psV1BrQkJVMFIxZHFzMk5hZDdkaWd5?=
 =?utf-8?B?NnMzTS9BSnl4WW9MSkx0YkxGcTN5MFFwWjlyTlRmVVFHVGU0ZWFWbFFnSUZw?=
 =?utf-8?B?Sld2MnRFNnV6VlEvbjFiaDQ4YVgzT1EvL0FNTFd2cTdFUmNyby82WDZVdkpl?=
 =?utf-8?B?S0Q2UVhZRDQzcjdsN2hvQ2YzQ0EyZi9Ha3JiaXRHMHBVcitqb3BCcE1kdHQr?=
 =?utf-8?B?QkRsT2NmUGs4eS9MY0lrMWlFSXUrU3BVOURaYVJMSmhZbU5neGxGbTk2RU14?=
 =?utf-8?Q?noXZynnRlJYC1RUlLL?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9655f04f-4bca-4f34-d86b-08de5383d30e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 15:44:37.9537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AUhDgM5yok99NuSSeIvH7TEyk7bLBR/kbaaIEwUj3VD9fjCRHNSYrbEIIaS4/5bN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9235

W1B1YmxpY10NCg0KV3JpdGUgKzM0MzM1IHBwYiDihpIgUmVhZCArMzQzMzUgcHBiICgwIHBwYiBl
cnJvcikNCldyaXRlIC0zNDMzNSBwcGIg4oaSIFJlYWQgLTM0MzI2IHBwYiAoOSBwcGIgZXJyb3Ip
DQpBc3ltbWV0cnk6IDkgcHBiDQoNClRoZSA5IHBwYiBlcnJvciBpcyBhY2NlcHRhYmxlIGFzIGl0
J3Mgd2VsbCB3aXRoaW4gdGhlIGhhcmR3YXJlJ3MgwrExOTA4IHBwYg0KcXVhbnRpemF0aW9uIGxp
bWl0ICg0LWJpdCBmcmFjdGlvbmFsIHJlc29sdXRpb24pDQoNClRlc3RlZC1ieTogSGFyaW5pIFQg
PGhhcmluaS50QGFtZC5jb20+DQoNClRoYW5rcywNCkhhcmluaSBUDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEu
Y29tPg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSA4LCAyMDI2IDY6MjEgUE0NCj4gVG86IEFs
ZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT47IFNpbWVrLCBN
aWNoYWwNCj4gPG1pY2hhbC5zaW1la0BhbWQuY29tPg0KPiBDYzogbGludXgtcnRjQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj4g
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgVG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEu
Y29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMC81XSBydGM6IHp5bnFtcDogZml4ZXMgZm9yIHJl
YWQgYW5kIHNldCBvZmZzZXQNCj4NCj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQg
ZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXINCj4gY2F1dGlvbiB3aGVuIG9wZW5p
bmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0KPg0KPg0KPiBB
ZGQgaW1wcm92ZW1lbnRzIGZvciByZWFkIGFuZCBzZXQgb2Zmc2V0IGZ1bmN0aW9ucy4NCj4gVGhl
IGJhc2ljIGZ1bmN0aW9uYWxpdHkgaXMgc3RpbGwgdGhlIHNhbWUsIGJ1dCBvZmZzZXQgY29ycmVj
dGlvbiB2YWx1ZXMgYXJlIG5vdw0KPiB1cGRhdGVkIHRvIG1hdGNoIHdpdGggZXhwZWN0ZWQuDQo+
DQo+IFRoZSBSVEMgY2FsaWJyYXRpb24gdmFsdWUgb3BlcmF0ZXMgd2l0aCBmdWxsIHRpY2tzLCBh
bmQgZnJhY3Rpb25hbCB0aWNrcyB3aGljaA0KPiBhcmUgYSAxLzE2IG9mIGEgZnVsbCB0aWNrLg0K
PiBUaGUgMTYgbG93ZXN0IGJpdHMgaW4gdGhlIGNhbGlicmF0aW9uIHJlZ2lzdGVycyBhcmUgZm9y
IHRoZSBmdWxsIHRpY2tzIGFuZCB2YWx1ZQ0KPiBtYXRjaGVzIHRoZSBleHRlcm5hbCBvc2NpbGxh
dG9yIGluIEh6LiBUaHJvdWdoIHRoYXQsIHRoZSBtYXhpbXVtIGFuZA0KPiBtaW5pbXVtIG9mZnNl
dCB2YWx1ZXMgY2FuIGJlIGNhbGN1bGF0ZWQgZHluYW1pY2FsbHksIGFzIHRoZXkgZGVwZW5kIG9u
IHRoZQ0KPiBpbnB1dCBmcmVxdWVuY3kgdXNlZC4NCj4NCj4gRm9yIGRvY3Mgb24gdGhlIGNhbGli
cmF0aW9uIHJlZ2lzdGVyLCBzZWUgaHR0cHM6Ly9kb2NzLmFtZC5jb20vci9lbi0NCj4gVVMvdWcx
MDg3LXp5bnEtdWx0cmFzY2FsZS1yZWdpc3RlcnMvQ0FMSUJfUkVBRC1SVEMtUmVnaXN0ZXINCj4N
Cj4gRHVlIHRvIHJvdW5kaW5nIGVycm9ycyAoZGlmZmVyZW50IG51bWJlciBvZiBmcmFjdCB0aWNr
cyksIG9mZnNldCByZWFkYmFjayB3aWxsDQo+IGRpZmZlciBzbGlnaHRseSBkZXBlbmRpbmcgb24g
aWYgdGhlIG9mZnNldCBpcyBuZWdhdGl2ZSBvciBwb3NpdGl2ZS4NCj4NCj4gRm9yIGV4YW1wbGUN
Cj4gJCBlY2hvIDM0MzM1ID4gb2Zmc2V0DQo+ICQgY2F0IG9mZnNldA0KPiAzNDMzNQ0KPiAkIGVj
aG8gLTM0MzM1ID4gb2Zmc2V0DQo+ICQgY2F0IG9mZnNldA0KPiAtMzQzMjYNCj4NCj4gU2lnbmVk
LW9mZi1ieTogVG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiAtLS0NCj4g
Q2hhbmdlcyBpbiB2MjoNCj4gLSBBZGQgY29tbWl0IGludHJvZHVjaW5nIGNoZWNrIGZvciBjYWxp
YnJhdGlvbiB2YWx1ZSBvdmVyZmxvdw0KPiAtIFVwZGF0ZSBjb21tZW50cw0KPiAtIEFsaWduIGRh
dGEgdHlwZXMgYWNyb3NzIHNldCBhbmQgcmVhZA0KPiAtIFJlbmFtZSBmcmFjdF90aWNrIGFzIGZy
YWN0X2RhdGEgY29uZm9ybWluZyB0byBkYXRhIHNoZWV0DQo+IC0gRnVydGhlciBpbXByb3ZlIG9u
IHNldCBvZmZzZXQgY2FsY3VsYXRpb24gbG9naWMNCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjUxMjAxLXp5bnFtcC1ydGMtdXBkYXRlcy12MS0wLQ0KPiAzMzg3
NWMxZTM4NWJAdmFpc2FsYS5jb20NCj4NCj4gLS0tDQo+IFRvbWFzIE1lbGluICg1KToNCj4gICAg
ICAgcnRjOiB6eW5xbXA6IGNvcnJlY3QgZnJlcXVlbmN5IHZhbHVlDQo+ICAgICAgIHJ0Yzogenlu
cW1wOiBjaGVjayBjYWxpYnJhdGlvbiBtYXggdmFsdWUNCj4gICAgICAgcnRjOiB6eW5xbXA6IHJl
d29yayByZWFkX29mZnNldA0KPiAgICAgICBydGM6IHp5bnFtcDogcmV3b3JrIHNldF9vZmZzZXQN
Cj4gICAgICAgcnRjOiB6eW5xbXA6IHVzZSBkeW5hbWljIG1heCBhbmQgbWluIG9mZnNldCByYW5n
ZXMNCj4NCj4gIGRyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYyB8IDc0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
MCBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkNCj4gLS0tDQo+IGJhc2UtY29tbWl0OiBj
ZDYzNWUzM2IwMTEzMjg3Yzk0MDIxYmU1M2QyYTdjNjFhMTYxNGU5DQo+IGNoYW5nZS1pZDogMjAy
NTEyMDEtenlucW1wLXJ0Yy11cGRhdGVzLWQyNjAzNjRjYzAxYg0KPg0KPiBCZXN0IHJlZ2FyZHMs
DQo+IC0tDQo+IFRvbWFzIE1lbGluIDx0b21hcy5tZWxpbkB2YWlzYWxhLmNvbT4NCj4NCg0K

