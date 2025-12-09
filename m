Return-Path: <linux-rtc+bounces-5520-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 108AECB0A07
	for <lists+linux-rtc@lfdr.de>; Tue, 09 Dec 2025 17:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9312C3009111
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Dec 2025 16:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B7B27CCF2;
	Tue,  9 Dec 2025 16:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DScCmXA2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010060.outbound.protection.outlook.com [52.101.46.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1651DE8AE;
	Tue,  9 Dec 2025 16:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765299074; cv=fail; b=I63QwhytD4uVgBlUGol6v9kM2GVz4Yz76KOa8YrbKNt558jVIHFDH7kzpRelkCbqYG+HMZayVezmkwBeN4DYs7piNTGZYWISQBEJ1yLhUgrm32erKX5iFmp4SL27NNrCMwsLbBILT75in16C2cKZ1g68dW9FzhN6Wxd1qIVL0fI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765299074; c=relaxed/simple;
	bh=Gyyq2k9DR2zYx8kNGLkCFl0uyFLPABxfCvgHdzHnxTE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YVOGK9thejxftNbIuz3eujis8UynlhH2IUjye4sEkXVNDYK70QhR7v1DCuPRcQdcnEvwWjglWQ9vkG71H3C8lv79LD7BlOhEl2V6jhm9RenR/jeZwfqyyjQ7D/6XvoGttzyXDtu0eUVUs8leag/0vIfOiT48LluXl2mQkPsbly0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DScCmXA2; arc=fail smtp.client-ip=52.101.46.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgJ3RRU1Cc/ETo7POEPkaT4w36SUTO2GkxQcBuLoa4juudMP5lY3hOdTYu7dUl8ouG4vdhAENeUlz+Gjgqj565Z/XBe6pUhIQ6P7VvsagcQ1RSYk+AEARAG38ZqoOQJr/CvdKq+J83aQCGkyBjv5p93vMZa1PHX2pnK+87UlSSrvSzD7+HLjeQvxwCuZM4XORV0bay8J3kvi8pVBxIomjJgsLk2UrzS88N7ithWq1nrYMy0Dj4TygH/Nso4jl2IW08hNWJGyF0IQOKXaOsdWzVGf1p28KarLjHI+KBSJ/hAlR/CATziWh0iPi/BSP3lv3MZnm/NfBAndxEje6o1wmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gyyq2k9DR2zYx8kNGLkCFl0uyFLPABxfCvgHdzHnxTE=;
 b=GKZGp6xAWzUkxEA7d7GbiHEiy1/xlnJklp+HOa8VhHbm5wlr5KqJxF3n8UC851QPS6UaaAmj3MQWnNkQQHmEYzJ43UyoSp3gay+sdNwKWpLmxkiuCZ5Ghq/O9f4c/qXYZJU4rqvi+9b2BVKX+gEJbEcbAETul57Z5oyem+d6rmt2AUV3jJT8cRlHoca5BEu+fZcrpJvKuoNj6XRXlOD2yh0TmRNQHBusTN2oDO82uwqCBDwoPhBzb34D+tq0ghiAy/gBAAmw676ZEh9MzTVT3HGFGBl8WeOZGCl1irfyQwLGslJWUGwfwqmgORdaYmgcqGYWka84wNFimT5ZSan2KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gyyq2k9DR2zYx8kNGLkCFl0uyFLPABxfCvgHdzHnxTE=;
 b=DScCmXA2IZe2dslCqf+paY9qIj6Ld94gw9iUBgXVjsLSCkHekXGbXPDyw8BtTLYA/4aAq6CkJAQddZY+31V8fGjGsl/xris+jiGv8NvnIL1J2pivZP2XOtPwEf5voKr1U58M8b8XlhgqLv1cjpOky8BXFMveJwZw2D4q4HBjSCI=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by PH8PR12MB7304.namprd12.prod.outlook.com (2603:10b6:510:217::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 16:51:09 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::56f0:2fd7:20e0:61eb%6]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 16:51:09 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/4] rtc: zynqmp: correct frequency value
Thread-Topic: [PATCH 1/4] rtc: zynqmp: correct frequency value
Thread-Index: AQHcYsGY5EDF7u31eEaj7n7Ktd5zB7UZkS9Q
Date: Tue, 9 Dec 2025 16:51:09 +0000
Message-ID:
 <LV5PR12MB980479009955E816E72E6EA892A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
 <20251201-zynqmp-rtc-updates-v1-1-33875c1e385b@vaisala.com>
In-Reply-To: <20251201-zynqmp-rtc-updates-v1-1-33875c1e385b@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-09T16:49:49.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|PH8PR12MB7304:EE_
x-ms-office365-filtering-correlation-id: 4cc9ab57-6003-48a2-1b18-08de37432711
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Rlc0dlh5bU5BazFZcUQxZFRWM3BDak4zMTQ1eWhpd1U1eVhLYVd4QlF2K3J6?=
 =?utf-8?B?cExuUUwyUlVHR1RZOFh0ZUZYM1hpanA5d3hMa2hxTTdHVEdLVGVhd1JuaG1U?=
 =?utf-8?B?QjdpZE5LS05JRmpOcmx2RFlWaitqY29Lc3JhTzEzRkF0T0VjV1YvL0p3b1lk?=
 =?utf-8?B?UloxRy95ZStxdDY0T0x4L0JVSTM4MEFtZG82dUFFVEU3b3RQS3pWOFRyMGFN?=
 =?utf-8?B?Q21Yd1ZtKzU2T0ZaSllVMndwdjZtRGdGamduS21SL2Q4MEE4aVM1Rk54b1M5?=
 =?utf-8?B?RmV6TVY4SnMrajdOL20zWk0wQ0NIUjRBQ21GbnN6eTdNelFyQTEyUTByVHNB?=
 =?utf-8?B?Q205ZWZNRm9VTXgwMTRyNEFHV1lEcFl2UGZGRGxVMi9vUmVuZkIxV2tkSHV6?=
 =?utf-8?B?ZGRENGpvZWRkc1pXTnVOc0NvOFF5bm8yN0pWU3p5ZXRwdnh2UWNrUFY3cXJH?=
 =?utf-8?B?WGY0SkxwZ1ZCWVF2b0lFcFRCUDVSVG5xOCtYSW1lV21xREN0cjFZSkJxV2oz?=
 =?utf-8?B?ZWg3TFJwMTRXUTBOK1VWUVByRmdJZ24rZFJWa1VhNkNxdldqQ1UrajM1MjFE?=
 =?utf-8?B?c2JCQ000VE5CMmtJM3dCWVpXQzlTRDRwN0crVHEwQ0hqbTFlNTdFeUVDK2o0?=
 =?utf-8?B?OThTZk9CcUNZa05Va1laZlRjVk5ZdXk0alFvYldlN0ppQ1NDVWkvcmpuQU52?=
 =?utf-8?B?TU1DUWRKMCtEYVpZTEtmYkRTRStOdisrRnJJbGYxVWp6d3BaODVkZzlTOWJq?=
 =?utf-8?B?UGJZcFM1SGpuY1NoaVhIWXJxYnh6bTdlTmdsY1BYZG9XUzQ1a3RCNytGQStt?=
 =?utf-8?B?aFQzNkhwY1YzdUIwZElVSEF6aTNvNXdDbnhLcWE5MHd1NGhvMXlteUxWeGpa?=
 =?utf-8?B?YWdyYTlpSktXeCt6VVdSeG9RdURQcnd6N1VaNlpFdUlhbWt4T0RjeVFyMjJo?=
 =?utf-8?B?MHlHa25hUHhiekUxTzhjeG0vRVU2ZmkwOC9qdDRSVSsyTkw2RXdNUGhoU3hj?=
 =?utf-8?B?TEJWMWwva1hxYTRNM1FQa2ttOUhFK0pxZmxGck80YnhYM3ozbitJQTc2aC9Z?=
 =?utf-8?B?L0FneXhDOVZIdExGdkhWMVBVUEdXaEsvdSt1RXpoWHRRaW9XdlJKSHV1WXJm?=
 =?utf-8?B?bGpoVjkwcmFtYWUrQUtteXFScVdwZmRlMUVQenl3VmQ4MmUyNHJjYzQyNkIx?=
 =?utf-8?B?eGFNa3MxckM3ckM2NDVjdldMMWtGUFZPV1dlckM1MFNnSXFIZG4xTGJSRXZM?=
 =?utf-8?B?WHdSeUJ5YVpjZmM4MmJBS0lxR3hMUmZBV0dvTHFqUHg0MVJlZVY1R0prMkoy?=
 =?utf-8?B?QjRLRDNkdDUrcjFsM2tBdENiNWJwZzhSRTRZRlJpV0xUUnQyUUFQNC9XRVdl?=
 =?utf-8?B?dkQzQ1FLN3V3ckVuRnJuZFZuWTRHNCtHZFVTLzJtZzNvWlhPTG5DM1hXYXRZ?=
 =?utf-8?B?eWdQZ2lWRlBFSi80WUhDY0NPcG80bzh1WFFYSWdoTTR6aTREQ2lpUXVsdXkz?=
 =?utf-8?B?cy84VXQzSUJ0WlRTOGlOQW53MGZXck9DcVNLNWxMZDFOUmxQSzRZc0UzQXRh?=
 =?utf-8?B?SWMyNU0rWG5jcTdMSVQvMFdsRy92T0RUUTJ0R3Z4ZlcvUnpQelY5S3FEazRF?=
 =?utf-8?B?Q3lsdHUza2NqZUlPM3VJR3Z1SjJlYmp1K2JtemQ3d3Y0d0R2Q0FQSk5YZXRC?=
 =?utf-8?B?eW5TZWNwbEpyNzdvdm93MXVaMHphY2poYVpicnl4Y09Wa3JQUHZvTmZhRlls?=
 =?utf-8?B?U2R2MUNyN1FzRDA5NXR5c3Q2NG1YejI3bEdOMkNVdlp0SCtwVVExRmtWOWhq?=
 =?utf-8?B?QktKRWxpSjNhZjFpYVVaZnB4TkFJU0hOLzhMOUx2L1ptelNid3UzZU9tdEFy?=
 =?utf-8?B?ZGg4RlZ1R3BKT2VHQURoMDNnekVYbVJaM1BYK1NPc0ZoYmpsZzZTeGVKdVJR?=
 =?utf-8?B?ZTZ5cmtEcmRiZzdIUkVLREdLUzIvUkxIamRNSkMwS1pORjBaWTFJcmt4Ump2?=
 =?utf-8?B?eHBzY20wM0h2YUE2S2lMN2tWMGJWRUdEVmhKZXV0M1BQMXNoY0dsSmtqTUQr?=
 =?utf-8?Q?WXqdvM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVFMOFZXZHUvSFAvWmxGTk9kSkYvbWpCNzNOeUZJYkFpUURkTldlS3VmNmov?=
 =?utf-8?B?bExGQ0s2K0dWM0h2eHdZTE8zZEExcndSWXpFelNMRVR4RHBrSDR1UDhTcXBJ?=
 =?utf-8?B?eGF4aTVpeG1oNy9ucWU0NEhzTlRmem9MQ3JaczhYeGY5VEFyNy8wS2NyRDdo?=
 =?utf-8?B?a2RoaGNDQlJLRllLdXZQOGlEd1k5bDhmaStPMnlVbVJoaFFaQUphdWNaWVVj?=
 =?utf-8?B?bFM5UzdNYnV5eXExc0pKbjkydmJFaTRmcURDKzdXY3pjMXZMYWk4UEg5YVFr?=
 =?utf-8?B?NHlQSE81TndZaXBkWnlXR1I5b1JlNHVqY1p4bERjWlhLbnFCYmt4NjgzNVFO?=
 =?utf-8?B?dTZNYXJhbi9KV1l0QXkxYy81NGdEUnREZXVJVnpzVk1qY3VpLzQ5Q3FLS2JB?=
 =?utf-8?B?WDhFdldwN3Q3SzlMaStzd1NPM2d2aUVZZFJjY2E1dWJvU2RZOUVUUEVpRnB0?=
 =?utf-8?B?ZGhxUGlRTm5XYk5sd05GTldDKytnR2xGTnlUVEJsNk1kT1ZBSlB6VWlGUXlI?=
 =?utf-8?B?M1hUcnUzYy9PMTFadVVlZGpWU2FST3FPOHpISVFjSFQrS3JadU16R24zbW11?=
 =?utf-8?B?cXg5Z3VINm94VFpwUldmaHpjTEtNODVCaEFuTXpIak45S0srZlZoME1iV0dE?=
 =?utf-8?B?SG9uU3R3SXFaQ0JnNWVLQVpOT1FaWUNueHZTQml3NklVbzY2K2xGcUVCdkJB?=
 =?utf-8?B?SWpkUWl2VzZvbWQ4NWlLNEVKTWRCVHA5VWRrNmpmZ2YyN0R6SWlBVktIZXVj?=
 =?utf-8?B?dWExOXdlVFFpYW1sSG5hVmNtMVU3blZaOGk0VUtCM0R6Wmg5K21zNXVPNENz?=
 =?utf-8?B?RGZCS0ZqeVNSWEU2MkxGUlNtRUpPcWlJZWxuUFlRRWg3Qyt2Z0kzTUhiYVA2?=
 =?utf-8?B?S1hKMFVnYUxqbk9HUjg4YlF5azFhaFg1V0Fac1FFT0U4dHFSU3ZmYXBINkZV?=
 =?utf-8?B?bm9odUc2WmlEM0g4MUl0RlNIMUVldk45SUVyQk94Z2ZNQ3NHSmIwRmxwT3NE?=
 =?utf-8?B?WjZKdUpaUFRjazRjUm0xRllXQlg5NytoNURMeW5sM1EzTWZtb3pBOGcrQlZk?=
 =?utf-8?B?aTN6S29iZmp1TVZtMnVhY20ydGNhZkRVeEg5aUNHaVVhTm52VW1GOEdKa3FG?=
 =?utf-8?B?TGtHNWJLTXdOSDVQK2FBTDVrdWQzK1l5UktjQUh3c0s0V2ZXdEdmNy9RUHM1?=
 =?utf-8?B?SGovSExyZ2lsZjAyRVUvRGwyZ0JYK0w1bVpZUVJ3a21NK0NpYWsrMVlvZDZ4?=
 =?utf-8?B?UVM2YkRCcWZkSU5DVXhTNEdaSmREa09SRkJ2UnYzbnZjZlVZYjYvVy9JVFJI?=
 =?utf-8?B?dWEwY3ZZUXBKM0F2KzlsNW5ubVljb29zV2Z3VC94aGpRSzcraU9obTJoNmJM?=
 =?utf-8?B?bDI2NVNzSFlXRFVRZXhWcnJreHNURUhObUFsTmFTZGZGUUxDNWovR2hFQVBx?=
 =?utf-8?B?VUNlR1dEV0lVdHk3N1VUZGNIN2xOM3hxdWFsd2RadXBIdTQ4NEpOeGZKbGdM?=
 =?utf-8?B?WStPTzUvMm84ZFJBM29WSTN4OHRiQ2Z0Rmh3MEs1UWg0YVJvVk1PcWNRSFFt?=
 =?utf-8?B?ek5TbGlNd0l4c0pqRzMvZnpKRHJFYU9QamlVZkVlNVdIZkJ2eHRjclA0VHN4?=
 =?utf-8?B?SGk1MkRLcDg4ZmtoZXRhZURJbVRjekJrVTdNRWJPNzl1UTFZTEEwS1V5bXd6?=
 =?utf-8?B?Y3NhaTB1cjJrOWp2blJMcVFKa0U4Ty9kTVZ1aTlvWVhGM081bEI4dThCYVNh?=
 =?utf-8?B?SEhNbloxZy9QZ3pLUHZFY0NqbTJlMlpwa1FrYlBuTkRCVG03UUVzMnpNclYv?=
 =?utf-8?B?UUhlWExhVFp5WngvUndod3c2WlBwdGF1OW43ZzI4ZzN0ZjNWeDMrSDEyejFX?=
 =?utf-8?B?Vm1GUnpZU2tMclJLMlBkWGlCQ2V6a3dTRUVuT2VISFVPNk1OUHJJSXZ6YTB3?=
 =?utf-8?B?ZHVmczNIOXdpbWU1bHdyd2NMMlNvME11U2gwWE0vL1UrQ2ZuSUJYTFZUOHVS?=
 =?utf-8?B?dHFnaVV5Vm4xQURBcE92VGU2d2hvMU9HSXBtcTdVbGZKRUhwTGorVnFEOEpa?=
 =?utf-8?B?V2NXd0dMdmZEMjE2YWRHaU5DWU55V0UweWs4L3NlMDBvc2tFdWpjWUh4YVlI?=
 =?utf-8?Q?RRgc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc9ab57-6003-48a2-1b18-08de37432711
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 16:51:09.0668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6dGBAG7A8gYOw0cX08uNJGKuHWTZW+Va9cw+sFDEOAw9xfjPtn/va8+cELYpdQ6C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
VG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiBTZW50OiBNb25kYXksIERl
Y2VtYmVyIDEsIDIwMjUgNjoyMCBQTQ0KPiBUbzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRy
ZS5iZWxsb25pQGJvb3RsaW4uY29tPjsgU2ltZWssIE1pY2hhbA0KPiA8bWljaGFsLnNpbWVrQGFt
ZC5jb20+DQo+IENjOiBsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBU
b21hcyBNZWxpbiA8dG9tYXMubWVsaW5AdmFpc2FsYS5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAx
LzRdIHJ0YzogenlucW1wOiBjb3JyZWN0IGZyZXF1ZW5jeSB2YWx1ZQ0KPg0KPiBDYXV0aW9uOiBU
aGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3Bl
cg0KPiBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9y
IHJlc3BvbmRpbmcuDQo+DQo+DQo+IEZpeCBjYWxpYnJhdGlvbiB2YWx1ZSBpbiBjYXNlIGEgY2xv
Y2sgcmVmZXJlbmNlIGlzIHByb3ZpZGVkLg0KPiBUaGUgYWN0dWFsIGNhbGlicmF0aW9uIHZhbHVl
IHdyaXR0ZW4gaW50byByZWdpc3RlciBpcw0KPiBmcmVxdWVuY3kgLSAxLg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBUb21hcyBNZWxpbiA8dG9tYXMubWVsaW5AdmFpc2FsYS5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jIHwgMyArKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYyBi
L2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYw0KPiBpbmRleA0KPiAzYmFhMmI0ODFkOWYyMDA4NzUw
MDQ2MDA1MjgzYjk4YTBkNTQ2YzVjLi44NTZiYzE2NzhlN2QzMTE0NGYzMjBhZQ0KPiA5Zjc1ZmM1
OGM3NDJhMmE2NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jDQo+ICsr
KyBiL2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYw0KPiBAQCAtMzQ1LDcgKzM0NSwxMCBAQCBzdGF0
aWMgaW50IHhsbnhfcnRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmeHJ0Y2Rldi0+ZnJl
cSk7DQo+ICAgICAgICAgICAgICAgICBpZiAocmV0KQ0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICB4cnRjZGV2LT5mcmVxID0gUlRDX0NBTElCX0RFRjsNCj4gKyAgICAgICB9IGVsc2Ugew0KPiAr
ICAgICAgICAgICAgICAgeHJ0Y2Rldi0+ZnJlcS0tOw0KSWYgZnJlcSA+IDY1NTM2LCB0aGUgMTYt
Yml0IHJlZ2lzdGVyIHNpbGVudGx5IHRydW5jYXRlcy4NClBsZWFzZSBhZGQgc29tZSBjaGVja3Mg
Zm9yIGFib3ZlIG1lbnRpb25lZCBzY2VuYXJpby4NCj4gICAgICAgICB9DQo+ICsNCj4gICAgICAg
ICByZXQgPSByZWFkbCh4cnRjZGV2LT5yZWdfYmFzZSArIFJUQ19DQUxJQl9SRCk7DQo+ICAgICAg
ICAgaWYgKCFyZXQpDQo+ICAgICAgICAgICAgICAgICB3cml0ZWwoeHJ0Y2Rldi0+ZnJlcSwgKHhy
dGNkZXYtPnJlZ19iYXNlICsgUlRDX0NBTElCX1dSKSk7DQo+DQo+IC0tDQo+IDIuNDcuMw0KPg0K
VGhhbmtzLA0KSGFyaW5pIFQNCg==

