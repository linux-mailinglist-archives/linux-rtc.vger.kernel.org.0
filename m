Return-Path: <linux-rtc+bounces-4120-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D0DABD29B
	for <lists+linux-rtc@lfdr.de>; Tue, 20 May 2025 11:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92A31188C3C1
	for <lists+linux-rtc@lfdr.de>; Tue, 20 May 2025 09:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BDC264602;
	Tue, 20 May 2025 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ocORBZpg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2054.outbound.protection.outlook.com [40.107.249.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E91F21CFFD;
	Tue, 20 May 2025 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731677; cv=fail; b=rxPDYcG7pV+Hr9h6QJz1QmZ+LYa2080CmXXNpCT8nsdu8L+HNGgoatpxApqzCAC2JxjGXfsIq99G8JYqEYAP3/PqL8k19nhXcX8cv8xa7+5Wjmvs9f+g0GewJzMe0MDtK6LK0dowfnuqUCPOJtI8XSsPg6wScQhK8Ajamtv327s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731677; c=relaxed/simple;
	bh=dVjXbw1V0YdH9EfyMvVZpolOTAI0JcKDWHsYhM0TZGc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JqDdfxuiZcidiRKMSDR8mrNAaTWZMu3ZuUoLyBd6Zb8gHa0rqiczEiEw+lc9j5Gwb02wEQwt8GLj8m30yTNZUhIJFBB9N/ar9TBA1gbvWspseIH8U0783CIcZqU5qSm81IjEU1qPo/poOx+i8FkeR4Cn886vn587Kd3lpwVSEvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ocORBZpg; arc=fail smtp.client-ip=40.107.249.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwCMQC+YqUmbv/YQa6M+s5OjFUXpg6AqBpbAaP83Jpzfzu0KJ6ldATK6jqBEVEOD8dNG8UwNvPxXoOz+4sv746KIcuPde6moxb2XgoLx8JLkW/6VWdKVRMw00iNOQ0mLMzEv0tSFN5HuAj32/bRmP7nWgt0NucaUAGVTC5U8EID/xBVgqOX9Z4LQQj0m3J+LJOf+qhKADIf+1q/rPEIXB+N5xMPvqogM/pZt+K0CBd+1mXaKENoyyLwK/pp1E3LYA2Jgw6eBRADFdE94oK71xcHDWBisVHyUX3iFuVcfOB8Fce7Wx74eES3rM4EFzM3QcKrImide3tcDQuFpqqU4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrlEaJUBwFUAOI5IE9bQNnQCLUYbdhXxQlL5y8DVKic=;
 b=mAtiYV5KQP1rLnUsax602RwMu7IKQsTHpM1+iK/CQwKM/zEwKXNTNME/Apf6mAsBYRkDG+fXlrxtpemVRRkGstOA6MC1uh56dUOeJBl0FkWekSVnH5B3GpmaKk4RboGbuc0Ut/BtY0fqNM2Oq3TOVetRFDjQ3NFe61/jp7zkpcZMsCf89xd6XQ6Wtg0XrFIuxKTkOWBUCMkrJfyMhsTJPLVofxiP5uphktYr8+0vdN5g+0WO9SvcJuOeXHCm6q0dZnbKKtvhTlfqrd6Y6FbUAdTAebSI7oocnF7Qvil8UzTIMT3KopvCqkdiBR1gPq6PkZPETgbAndQv5RiPi8vzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrlEaJUBwFUAOI5IE9bQNnQCLUYbdhXxQlL5y8DVKic=;
 b=ocORBZpglmvVXe/ltRk/GcfJcWali+JTwstXP5/0iPEHVqPaK3JxZCMCtfqhDtG/NyQGVeTtMVam8/krUnxEiHGmAWc1VqZDExCJCnBS02fWGU9iGyMXT8Y2+3TrSGs1fdO3h5ENFFSi3ksHmfBIw0X3tcYvlYvv3L0ZHQiH68RxvA7W02MRJ+PHTiZvJ4+VxxNHaUqSp/9CvfMoBlFgLAP0V/wlCRXGuX945lgqFJxrE9Q2IhJb/2GyO/tw8PE3TcFlixM+nrY0DZzR/V8dX49HJ4nmYBu1XOW0zRPEKBoKCEAD/Igi5ON/3edTZTZd0TPU9wlqgReh3ltTgs5fZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VI2PR04MB10906.eurprd04.prod.outlook.com (2603:10a6:800:277::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 09:01:11 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 09:01:10 +0000
Message-ID: <6027483f-336b-4fad-a969-dfef1c454de7@oss.nxp.com>
Date: Tue, 20 May 2025 12:01:06 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] arm64: defconfig: add S32G RTC module support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>,
 imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
 <20250403103346.3064895-4-ciprianmarian.costea@oss.nxp.com>
 <c4a80c1f-56a0-4cdf-afbd-cb2c13cc0b8b@kernel.org>
 <6ebb8c15-9ff1-4bf3-bbf3-c91aa387d873@oss.nxp.com>
 <dec769ad-5144-4503-9714-d9c83a4c242c@kernel.org>
 <b7d82f31-05d1-4331-809b-e865d21c958c@oss.nxp.com>
 <2025040408532288b38dea@mail.local>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <2025040408532288b38dea@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0032.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::18) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VI2PR04MB10906:EE_
X-MS-Office365-Filtering-Correlation-Id: 1840981e-c0d4-468c-abed-08dd977cdd30
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUNuY1h2dmZ5alduWE4zWTdleTBZUzkwUWVENzZxSzR4eDRxejJINUtTYXpX?=
 =?utf-8?B?ZUY4Mnhvd1NCbnI2c0Q1cHI5a0l6Qm9QdEU2c0tzVk42ZndMR3RLYStUUyt4?=
 =?utf-8?B?Qkd5dkx5SlpXOCt2NjB6YndLSG9XRHlXdWpYd3B3UGNwZWFXL2JWUjJYbStU?=
 =?utf-8?B?cTZhVE8xL20xek81YVpKbExhMSs5VHlPQTdKTy82b3hLWmF2d2NyVmpsR1lB?=
 =?utf-8?B?Z3dDZTNJVjcxdDhNZDAwd1o3RWdsdGVuQklhd2N4UlVzNVlRMktiUkdlTitl?=
 =?utf-8?B?VUx2NG1mcHROK01HRzdvZm43SkNWV01GbFFuQWZwNUtqYjRib3RSWVhtR0Fv?=
 =?utf-8?B?S201V1lxYkR0QzVjVDAzeGFpYTJnNGNTRXdSWndHbDBkditXaFdPK2xnS0ZM?=
 =?utf-8?B?a3NMMUhoc3BlaFY0TnNWd281NDFvZlpJWnJCbE9TbEhFUWgyNWJaK0tEOTAy?=
 =?utf-8?B?SytqZ0lwTTR0YTluRWdFSHVCNHpEL0ZBVGNyYUQ5bXBROGNQZE13Q2FiUnli?=
 =?utf-8?B?Yi9DcVRJNkExL0J6YkRLVHpXYXJncEdRUHI0RlBYcjdnTVlPeGN6Nkw2bDFy?=
 =?utf-8?B?RWtma0sydWc1RC9RM2prbUR0eVE5OG1YSkxnNmdqMlJzU1R5UHlGemFwM1M1?=
 =?utf-8?B?WEVSTFlmcHNGR1p3dDVyT2RnZDlScG5zM3ljSVBDS1o1OEdmRkxseFU1c3pQ?=
 =?utf-8?B?UFdIczdYK0xvc0R1OUx3dmxNUTk3bWo2N3hPVDEwNWJDRXpwaHQ2NUV1MUpo?=
 =?utf-8?B?SVd2US9ZWG8yaWs3bXoyeUxuWkVReDBZay9ZZU1ySzh2elQyOHViY0JXZkM1?=
 =?utf-8?B?ZFJVeHAzSlZyeFVzd2lYZU9LZTNTb2ZWMlM0V3ZRRWtXTzhkT1BuMmJBa0FU?=
 =?utf-8?B?aW05UDgxNzJzQmtYNVl5Z0Nacm1STG5ZbytXWEQ0M200d1B2TjhmaU5zbHlx?=
 =?utf-8?B?SzFDYndjc2N0NWJRc213KzlFbDJHQzZwbWc2NE9YQ2VBVTNZb0ZybWpTZCs3?=
 =?utf-8?B?MmJBWWN3VWZQM29hV2cyNDJhMm9CUGNSZFNwOXFjZit5YjFwY250SEUyVnNn?=
 =?utf-8?B?QjVKaG1tYzc0UjYzb3pRMkFZMktxQU83TVl0ckFMSjc3SnA2MzB5T1IybWhp?=
 =?utf-8?B?TU1GcmxGMmpZY08vcG9ydlpUREI2aVcyb1p1cFVOYXNmKzFwSlE1RGEyUWFG?=
 =?utf-8?B?UjRscFV2MXhOTmJyTkxsV2hLWWY2bmxnUDJTbzJpUGl3WGpxRmFOZEFBbkFu?=
 =?utf-8?B?TmtHd3ZJNlJZU0FwNGVJYUFyUUNsN2F3azNMbFBvYTBnS0hQOEpRLzlhVFdT?=
 =?utf-8?B?TmUxNGtuRVY5VUNxWit1QkE0SDVOL0M0dWxxUTgvUjFUdDFhb1U0R2lXK3pR?=
 =?utf-8?B?eVBKbjJwU3Fldk9Bc3ZtckNPM09rRFRDSERhUUZyY2xya2wxSTIyRGk5QlVm?=
 =?utf-8?B?SHgrU3VFeUV3S0J1UjFMM3YvQXdLOE9lc0Z2NUNyS0ZvZzI5UDdLdG9wVW5K?=
 =?utf-8?B?d1hSeHFYbUtWMmFPcGNNY0dDUGtBYVBiOXhWQkk0MXBudmFiZjh6Y3JOSkxR?=
 =?utf-8?B?VXZ0OWNFem9FNGxBcnRGOVlVZllYalFucWJPdGI0ZnlSc1VxM0FTZHpabFRw?=
 =?utf-8?B?WHdpQisrZ01UOS9zbUZlRE9UL05rQ1dIZVJTL1NnV1pINWxjajlRZGxrY3ky?=
 =?utf-8?B?YTd0MzUybHcyTXNubHJiN2syWGRXVmh3cW1sajVQazNIeEdPUFdEUWxlZXFw?=
 =?utf-8?B?a1UrWGNYa3pTS01CTFV1bU5weEJWSHAreWJackV0c0JFVUdCZ3k4eEpCRnMz?=
 =?utf-8?B?VTl5ZGtSMDVxRENQLzdJU2NQeWhFejNjc3ByRjNaVUhjTzRNNVNwNDJpYjNJ?=
 =?utf-8?B?RURSaG9ZdERONFFEYk9KRTk5Lzd3SUtObWgyTFVCTldvbVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlZQQUlHcUQvSWFiemV6QzM0OFViV214b1dhMUJlcEJ2MTZ0YlFUUVBHTWR6?=
 =?utf-8?B?TmMvNURJSzZKRWo3Ny81dkszZHR2U3BiR3MwZXhUMDNMQXZvT0UwNjZvMEZz?=
 =?utf-8?B?TXY2WGFVbGNYL1JMZW1hb05hbHpsUzZqOE1tZ3E5NDdZem9hVXlWSnNKeGNP?=
 =?utf-8?B?em5ySHhmWTlnRjNjY3RSbURjdEdReGt4cnNGNkswZ2JxZXNRWWJHMFcrNjN2?=
 =?utf-8?B?dXdBMHpwSWRXTVUxZm5yWmxkdG9PWk5nTDNIU213dWtzOHZyTDBSeFFBMzdN?=
 =?utf-8?B?NWtxSE5wOFVKRnE1aGlCL21HZWI0L0h3M2RvL0JVWXVYTXhxdUZVQThMa0Jr?=
 =?utf-8?B?MlRyMjkvU3Zld21KbDBnSytveVhNRXY1c2lYV3I3WFhGRTdnYUs4S2o3Mkwy?=
 =?utf-8?B?Tyt6SFR2OW8xbUo3RFlCdzdPMG9CM2NSZjZLdlFJM2dxSzJjNWl5UXhJYWJK?=
 =?utf-8?B?cSsxSGY1dEtsNDZZNEpVMk5rcXRyRjNVcDR5Q09mUkd5QXlpeHNXTnU5bVFF?=
 =?utf-8?B?Mmg3V0lDVkZaRks3M3p4TW5RVmZ2R1pSTURkdmltb0hvdmlLOUd6N3RkMFFw?=
 =?utf-8?B?M3A3dldBV2dvV3ZRcU9QOWV4eWVTSzZpU3ZaVmN5UWhSeEdZUER3S2xrdHdC?=
 =?utf-8?B?eUo0eERpQzFncXluVWxiOURGaTIreWxCRy94VmFSOXgvNkhhYmdSbk9DU3RT?=
 =?utf-8?B?dlZHWllQaXBOY1dsRktIc0VRK3lENEtESEk1bkRWanM1anB2aElsVUdjYjBp?=
 =?utf-8?B?bWZVZ0FMejJ0R0Zaa2kwMmhWcGdjUkx4T1dMSlBtREEwaTdBcUtObmZLOEFF?=
 =?utf-8?B?TU5Rend2T0t2a2thTXM4MWROODZxM0JNTGd1emI4c3B3ZVNTcTYvYmNicFlu?=
 =?utf-8?B?UWpKNXJIQ2k1WU5iVERYRmIxZ1BhbXJqQ2V6eEFVQTVjcHRUb3RlOGdNWG5T?=
 =?utf-8?B?V1hMQm5GMlFTRnFGOVJXWVErMU9uR0lsNFB2WHNIVFJ0eEVxZlJDczJ2b2Ux?=
 =?utf-8?B?eDk5Z2lwOWhlaTloY1lJcGo4c0NzYXduZ0F2ZERucjF3L1B2dEhyYllTb3lt?=
 =?utf-8?B?ejUzVi81Y3VBODU3VHVJcGhIOTFKR0tRTm5IZlZnamVmNkxnRkVGQm4rbTBj?=
 =?utf-8?B?WGhuejFCR0crRGhyVC9CSUwyaGw4eXBIM0l5T2hUUjVBdXZESXg2Z05iM0VR?=
 =?utf-8?B?QVBxRm5rd2pPSndOZXBYNUxST3pTd2tVM3NDcW1Pb0tPeDExNVBJSlV5V2lZ?=
 =?utf-8?B?LzYwSlVneFBnNG84SHRzekhKeFdqd05hcitHSkRIVG9XMVZmaXRVQWNOQm1Z?=
 =?utf-8?B?dGxvanh3REQ3WVBDczk3N2tVZEVhbTU3bk1ZMHR2SEV3M201dFRlcENWeHJB?=
 =?utf-8?B?UWhOckpQWVJ5V2N5SkRKNEE1SDJuNWpQM3owRU1nYjdjVGNhQndnc3Y0djhI?=
 =?utf-8?B?c0Q2ZDlwU1M2M09TdmdySnRVVUVHajVXaFBWaEJRRCs1cHV4bzBidE9kZXd2?=
 =?utf-8?B?OUhMdVBxdGtTakVNSFB3QlBISHl0bjZxRFA3THo4VkhHVHl2cU0vTmFYSnhO?=
 =?utf-8?B?U1M5WnUwTWZQbXh2c1JnZ2dFMnVFZXpaQlIreFQ2REFPQXo1YldwN0hGdXhN?=
 =?utf-8?B?RCtxTC9iZmVtNHpMek40MmtzOSt4SG5pUWc1ZWczRXdLOFFKMzFSVXFtbUdx?=
 =?utf-8?B?UEdldWtTZHo5MFd0bThMUUFxOEZrN1lMWkhSZGdUVzNZQWJ6TXBQRE5kcWhD?=
 =?utf-8?B?STdYRlJLamtBMGdRSXJldTFyNzFDUmt3bWVMd3pGMHhHeW5Vbk1HQ3g4aERQ?=
 =?utf-8?B?dHNWMjQybmU1cENZMXFuVXVsUERsUEsrZzYvcXFQZW4xL1ViWmFTYnM3SVhu?=
 =?utf-8?B?Zzc2dkxXc1BudXNzaVFuRnZGclN6eUdaQnV3aFd5R2MrYzRrb2hxQldRQzFj?=
 =?utf-8?B?L2dGQkcwSzhmM2FWZlQ4L1VPUk80ajA5Y2FtQ2JBb1hsUW8zZ0tQQVlMQmds?=
 =?utf-8?B?Y1VmeFcxd0JmUUF0WEJCdlRSWnE3NVQ3alpsRUEzNGhoN3IzTTZpMTBGUElT?=
 =?utf-8?B?NHlLMnVtemdpRWlESEQzL0V5LzJFaVh1NUhPMGlULzVkb1JMb3lwYWU5dlVB?=
 =?utf-8?B?bGUvcHBQclhpa2EvV3RXUzFXcVVVZC85MVN3ZEpnSDYyY3BPaDlPVktQR0dt?=
 =?utf-8?Q?KOAlWf9LDDbeZK3Jzbn7+uA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1840981e-c0d4-468c-abed-08dd977cdd30
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 09:01:10.5338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80EL+uB+td5o9V548UQOq9ttBnv9+luOHP5wjAd83fdTGTdDYEoj5keN+PQyK0K5vm6gh4wiTjbPhfo9s/k/gqa+RJvsTm1a8IqdXB9khCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10906

On 4/4/2025 11:53 AM, Alexandre Belloni wrote:
[ ... ]
>>
>> Ok. I will send out a V10 in which I will drop this current patch from the
>> patchset. Also, I will send the DTS patch which adds S32G274A-EVB,
>> S32G274-RDB2 and S32G399A-RDB3 usage of the RTC after this patchset gets
>> accepted.
>>
> 
> I don't need V10, I can apply V9 without 3/4 and 4/4
> 
>> Best Regards,
>> Ciprian
>>

Hello Alexandre,

Sorry for bothering. I am writing to ask about the status of this 
patchset since it has been hanging for a while.

Are there any more changes required from your point of view ?

Regards,
Ciprian


