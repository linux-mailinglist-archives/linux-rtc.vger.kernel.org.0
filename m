Return-Path: <linux-rtc+bounces-1405-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 494A991A850
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2024 15:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA5412838D4
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2024 13:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EC0194ADD;
	Thu, 27 Jun 2024 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="pGPCssMk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5204815FD1A;
	Thu, 27 Jun 2024 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719496216; cv=fail; b=rlSMmXoylTQT8xSZq1U0aRGd76ZiYYermUehFwJkz/X7P2IfPfOWZc5gv/jbSRSHLhsu1QV0eR5Lr78bqIuOb6mLtP13GqUaCbOURHz1MrFvzhhX6qtv3MqLPYjyUq8CNo68t3/oVZ0qAAJMcmL9x3BZCwaEn3u0IyJz0FITw6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719496216; c=relaxed/simple;
	bh=NulQ5/NTSVlXGlFZgJd82IWWk9mJ/RoAmgU6nVcH4YU=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ui9U6QVTlH5KFwUlbnoRtsQqwCtzYLbFd6+6DSP097AL9Y0myoykb5zTtLddjvHSB04GeEFrdF9z7MD26J9V46Pqr2j6CtT3iGgrfJ162UhbcdSMmKmvERVDVPtOeRlBKjrTQ3cWBQbnamVIQYcAsISCDbdN3lQRpYRE2e55hbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=pGPCssMk; arc=fail smtp.client-ip=18.185.115.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.3_.trendmicro.com (unknown [172.21.186.216])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id CB44910000C36;
	Thu, 27 Jun 2024 13:50:06 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1719496205.691000
X-TM-MAIL-UUID: df9ad91e-7d73-4cc2-9e11-8096bd8e8c95
Received: from FR6P281CU001.outbound.protection.outlook.com (unknown [40.93.78.3])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id A904810005BB4;
	Thu, 27 Jun 2024 13:50:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyZAxQZwYIWAysqwoL1CLEqB0eOCozAqC2ki12KuTL60gDA/HD80oTvKbKIanu1naAVxHulDPnrXR/i/AxOAiPmGwTFxwDSzY7IUyO43pos+hLxs/vshADnDzQfGgC0ZAko7nsouowGbP7NFamSO9Ade5YDSt2Mu1LBqXdDNexuXbqqLs42u/S1y9Q3EHtxKQ+EtLzX/6Xt6JCWSBChUeNnTMw7+Z+PFCHEpiQTjnk80c6YzNDTgJjsMAvy+QFnqVGeIRVp0q3yb4aMnFVFPQBpfQLyYVDKjae/Cb4fxcGbcn2cieGBmUyyNdprVHuAV7J0gNZhR2FwmndhJHguPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hy0UmUGqsqbvbZZhQY20I8c0MDJntzEPRvkCXKbRcA8=;
 b=AVqQyxD8zKonbi4RijHCn7No0vaEnXPdT0HyWszIWc2Rq8GUeWWV8mjnzCiGRl/TOUaNMcsSwFUDxmcTVQBe1+QFe+XVjobaMGYVF259GiLGVWfhnEDex2OOLxawlugjYJ8Ajt2I7cdvGEafLbUuWObWWFXRijBh63dTA/BdwzHbT01nrw3LD+tMhdTs0WJRJ3npt8qJhj36xPwvl7f6jwlMaULwAqXLuYd5LYsU7U068itmqBJE7Yj5EF29yf7/BCxy+LznsCYFPFDCkkTASc+N82O1qoeaV+jljlIs8ZKYZk4oi/JXptl2eE+Jq9NFvESQEkfU59KCKTaWI4qQBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <3b2d5e42-314c-47b2-9fff-cd1a26cdf89e@opensynergy.com>
Date: Thu, 27 Jun 2024 15:50:01 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v3 0/7] Add virtio_rtc module and related changes
To: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev
Cc: "Christopher S. Hall" <christopher.s.hall@intel.com>,
 Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20231218073849.35294-1-peter.hilber@opensynergy.com>
 <684eac07834699889fdb67be4cee09319c994a42.camel@infradead.org>
 <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com>
 <db594efd5a5774748a9ef07cc86741f5a677bdbf.camel@infradead.org>
 <c0ae63fc88365c93d5401972683a41112c094704.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <c0ae63fc88365c93d5401972683a41112c094704.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::19) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BE1P281MB2258:EE_
X-MS-Office365-Filtering-Correlation-Id: f8bc3db6-5399-4969-200c-08dc96b00bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ylcyb0tnQlB0Wm4wUHBvMFV4VnloYmZoVGFtc2FxcjA3NEY0TDhvd3BBemV5?=
 =?utf-8?B?eFNWbHBPTVN1TFpwN2tQVHZ4NGNSSmlpckp4c2NiSjVENlJBc2FrMEFmWjJM?=
 =?utf-8?B?R29HeEtvY0ZCRDVSRGlQRDk2cXJWZDlWeFA3VnpEQlV1cmlveUI3a3RuZ2xv?=
 =?utf-8?B?SmdPa29YWUViR0g4eXRkeDlzOHFSdXhNaFJIekRMUWJqRDdRVlFDVTZKK3RZ?=
 =?utf-8?B?WmRCU1ZpM1lzeDNMVVFCSHZHZVFId3JMcGwrMTZPaWZ0eUJBZzkrWjlka2ZN?=
 =?utf-8?B?VjFFSzlZY1lPZURNUy9FeHg4NjBMVElNNnFKTnZqSlkzY3hIRGF5MmFRczlH?=
 =?utf-8?B?aW82aXI4WkR0OHhqSzc2d0ljb2Q1NlBlYUFLMFRFMDRKWWpvVjVkVUs4SG5x?=
 =?utf-8?B?SEcvNS9VWE83bm5BRjhnMzJIYmRVVXVTd2dhQUFpVHZiRUI0TE9Qbklyckxz?=
 =?utf-8?B?R0dkODQ3UTFvSGdtdDJMaWdEYVZWM2g0QjNVUHV4ek52ME1obXNJQkFUQ3g0?=
 =?utf-8?B?eFZVNmtGV2NGYlBSU3JmemVEZnJUVVNhTzNITzFkRGdKTFg0RlpOUDU3Vi9O?=
 =?utf-8?B?R3pXbWNtOHkra3cwNHpzOVJQaTIzZjZqK0FiOUkzUG13WGZDYTIxSEtXSStt?=
 =?utf-8?B?MnJTbnQ5eHhFWmxWMWR0ZEc0SW5OOWg0c2tTY0VaUzRKQXJhenUybThBVzdX?=
 =?utf-8?B?SzBOWDVsUU5ZWUxOdEVZeVRvM0RRODFRc00zTkJ6U2VIcXg5b29vSzl2d01p?=
 =?utf-8?B?OEJmRkZxSlQ0MjBHZEhFZG1JTENPQnluWFFsSTZFQU4xa0Rzb25oRjJFS3Vz?=
 =?utf-8?B?MUd5NUcvZ0VrcVVGNXkwNnVVRmUxazJrSytwV3VqMjFLUk1DK2ZzbGRuTWNH?=
 =?utf-8?B?Sy8yanJZMnI5bVozR0cwVkpEaTkzKzJycmJGZnRQWXVWK3ZaZytIZmova2FM?=
 =?utf-8?B?VXZ5b3JQUk94ZEdDNkl3dDl6US80Y3BjQUxMUzQxK1ZFb3JEdHY2SWtnRjh5?=
 =?utf-8?B?Y2srZHBacDdPZFhhVzJjSVNwZDNJVFUyenc2OHE1WVd0RWN0d0wzWkdzam5Z?=
 =?utf-8?B?Z2lMT3NJT0VLWmJZTkVtUlk3S3hSTTZhVXFGbHg4SzN6Q2duNGlEMWUrWElJ?=
 =?utf-8?B?UXdlanhYMkhFeHYrejBhWGU3L09DWnJYVmpFZmgvbXJRL3Uza3A2ZHVvSm9U?=
 =?utf-8?B?MjEwNFc0bjg5NUVFalpWdFhMZE1yc0NIb29ubWZUWTlna0VIeW04SkdhUWpo?=
 =?utf-8?B?K3AxNzJQb2xEVEJlelc1TnFsSFhEeUJYS0kwWUw2aDFidXNDcW0xV09RZldS?=
 =?utf-8?B?NUhwOVI3TS9DKzVZZWJCYUFpY2Jmb1VOemI3RE1Eczg0eW9ZdFIwdG9LbUNy?=
 =?utf-8?B?NHF6ZzB5Zk8xWFd0L1VINmxYSlZDejUzVm4zZzBsN05GZEczQ3Jhb3FFcXpF?=
 =?utf-8?B?SEYyMXZmdzgwYy9DekF3eHhsdlg3Smg2ZmxwYUIySHQ4WkVvaDRJK05pM3dn?=
 =?utf-8?B?UDVkVWNvS2xpY0tHWmlMY0l6QzVHbzJvVjZMRnFCWCtNblR5ZG5pRTR3MFlm?=
 =?utf-8?B?cExicTl4a2hGWnU0NittQi9GQ1VWYVpWSDZqSEc0TnpTekJUTGtDSmR6ek5a?=
 =?utf-8?B?WFl4VytxRVFDRWZkbmJyN3NmSUx4WlJCZzhqcC9zZkEwRU8rZXc2WGJTTk1T?=
 =?utf-8?B?d2ZMMmViZFZydVRYVkxqR2s5MS83NWZFRVk4dVEwVjM3OWFmWHZGMk1DRXVm?=
 =?utf-8?B?QThncHYwdlBVZEdOS0RtWUhMNmlFUGF5MWw2UGJGRVkxZ3RuWGYyN3NUSlFD?=
 =?utf-8?B?MlhVd2ptRDlPMzBjYlZXUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azhta0V2SGhVQWRwY1J4L0R0S2VQUzJCQzk0cGtjTWxyVkl3TjQwMVRMZzVE?=
 =?utf-8?B?NG8veE4vSS9jeFNtRjVpNnNwQnFMRnV5SDJ3WjhIWTh2NzJkN2k0aHIyVXRR?=
 =?utf-8?B?UzgyWDVXVXo3dDVTL1psemlWL3JrSDYwMGtqT3gxRE9qcGV3UnJXZERkNTB4?=
 =?utf-8?B?Um1FWFUzWGVqNnUrZ1hsRENHdThGQWcwbzZFRFRYRGQzTlNVcVlDYXdubENY?=
 =?utf-8?B?SDlieWNpYnduem5jN3kvcVl2OEdxNXo3TGl5OUxXb0FkYjRpUGplMWxVQXBF?=
 =?utf-8?B?V0lLbVpLMEpqVWtRa2NTRW01ekFXSW9SZlBBSElFWjdhUE5kRzBiZzhTTkdH?=
 =?utf-8?B?aEpEY2c3dlpLUGFkTGIzSUIwbysxZk9XYnlHUUpkb3hNc1BqVWNKR1Jra09t?=
 =?utf-8?B?OUV4eVl4WWswRk16anI0a0dWVGdoeUZzVGtCYnhBdkF2MDNKbWoyS1dIRCtk?=
 =?utf-8?B?bnR3eURWMzlvMDhoQTJYUFVNN1hxVnlBZUl1SElCTDFwd0NIKzN3dm45SFRN?=
 =?utf-8?B?RWRTOWRIYjVWRDdDL1Evc1lMRjdHS0V0cU9jNFdPd1J6cHV3bWJwY25wb0hm?=
 =?utf-8?B?ZldUR3Q1NnNMZkRJZzRnTEsxOG84T0N1Kzk1OGxkbHJ5R2RiYnhyVlVYekV4?=
 =?utf-8?B?d3hUNTVyNTNTTnVpYlluUGZwc001NnQxaVNXN09pMzNRMzFOTFhXUUpBQU1P?=
 =?utf-8?B?T0ErZ2tOZ0J6QU5PRmNjSVlOTEVUcXg2bnVZQll5dHV3T3Y4ajh2VG9PdlJO?=
 =?utf-8?B?NXMrVXZ5VHloQXJ3anZmditVYkE0alYzU1p1eVQzYm01UzR2T3BoZXFnUWV3?=
 =?utf-8?B?RWdiYlBZWDZwYXdqR1YwRVVncFMxR1J4VEhsN0Q5Rnl4eHN1WGxlMENJUXB3?=
 =?utf-8?B?TUs5cmVRSjljQk5PemtSdEVGUlh5bU9zUWJvcjl1Q3pCOFJJOTN1NnQ0SEY2?=
 =?utf-8?B?allOTTVucU1BMzlqUGxKSjRrZUlzc2pUbzgyK3ZWVGtHcHZXSWQ2bEk1RXlm?=
 =?utf-8?B?OUZDUisvTmt1R2d2dG9VR0lWSHNzTThaREpuWWhnR2F2WjJueURUbGJsLys5?=
 =?utf-8?B?UUl5NW1NU2NYSTl5SXRBekhsL0J5TFZvU0I0TTBqUmpNVGMvOWlMS1VDV2tR?=
 =?utf-8?B?ZFhSejhvOVNGMlFyUnZVYzZNWFlTUWk4ckU5TFY4VXZoWVVPcjVnQjZtdnNa?=
 =?utf-8?B?bEo0YnE0c0JITDdvQi9Oc2taSWZRUHFPRnA3T2hDUjRTWHdEY25FSHZQeUhn?=
 =?utf-8?B?WTRGN0tMb01jSTZHOEJLaTRTQnpicitFYzE2MWdSSzYrWjUwMGVydTdBcmxD?=
 =?utf-8?B?aERHei9vREVjTGoyUGN4Z3N5MlJqMFl1eDc5cEh3UTc5dXptYTM1eWJ4Vmt5?=
 =?utf-8?B?RVVISWhUeWhCdzJtS0lzUHNWeXJETEFBOU41TzNrUzdWTWJkeGpwSU1GN0NX?=
 =?utf-8?B?WVFYTlhHYkd6OStjZE9iS0xSNkZ6OG42RHlybmVvZUZLTEdhUGptZDNQSEtJ?=
 =?utf-8?B?dWRpeWNiVFJTY0M1YmYzZGZ2eFNSRnVVbXp6RFhEbEczeDAwYnIrMko1dk9Q?=
 =?utf-8?B?NFFIcmdQeDBhZWNzQzRqZE9lWGQzQnEwREg1ZTFHR3ZhWWtQSlVmS2J3Qmtr?=
 =?utf-8?B?cmpWSFVteVZYdUN5UnFCNjRLNFNUY2lRKzk1YkJCK0NvbEhHZnRVblR4ekdF?=
 =?utf-8?B?NVNMdGlmWFdhWXl0aUpsNHp0Z1d4WlJaWGpVUlRROE1KNG90OVJpa3hvZklx?=
 =?utf-8?B?dDZDNkUxRThvR0ZuR2t1bURqRVNWbnBaTW50RzVSMU1YQmFGTjBDWm9SR3BW?=
 =?utf-8?B?cGxoSWVlRjhXeUVkQlRIdnZEZmpWZlYyOExDMFMwVEdrZmRDMCt2cVc5bUdh?=
 =?utf-8?B?TGQ3TmhLdVQ4VVFIc3V2dDMzQ2VxdnMwQktvdHdzdmdxeVdSQ1BWRmt6bGV5?=
 =?utf-8?B?aDhkcitXNE9aa3VpMkl2RWFHUG1aaWpIaHh0MVVPVUVMRC9CSnREVjNWNTdl?=
 =?utf-8?B?Skw2NVgwdFlKemM3U1dDTTdNVjlPSWJBMVlqWm5QcG1zZXpQWlVST1g1WUdx?=
 =?utf-8?B?bmUxekE0VkRyOUZFZkdhMGt0Mkw3MVNGa3ZOcFJHR2tlemlPcitJdUtFdytR?=
 =?utf-8?B?Rm9vM2NCLzZHYlJVQk4zWmJkU0NudDhjMS9RRTRJQ0o1UjZaano4RzdySk5R?=
 =?utf-8?Q?kU/jbewehgUWYnowHG3OAw0Dh3b+bjkiuN3oawmrmIbn?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bc3db6-5399-4969-200c-08dc96b00bcd
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 13:50:03.7960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9nYWA/IA0YLHJS9rDQOAdJBhAE9B3uOgHvqn3/vmjc+05N8TKQlyBGy83ZE0I4y4CqaWb3SWCF3Ee1OpvYkFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2258
X-TM-AS-ERS: 40.93.78.3-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28484.007
X-TMASE-Result: 10--9.811000-4.000000
X-TMASE-MatchedRID: vbSD0OnL8/L5ETspAEX/ngw4DIWv1jSVbU+XbFYs1xLdW4uWvfHdWK5+
	xIrSsu9+dmOLruO1JQy408OcRgzs9x4GmkTmuRuMR6eMmpdkcdlXGVnGh7t0Fj/HZC1e17GsPJ4
	InNa64Ij+qOXfqBGB6kyzam3z+OsCn/ouPa6xjN9tQGSmwNdechLkfOHvRgPisrdUwi5wd7Rz2Z
	8LmlZ+sPB6y7q4Knb2n6BEY00e/jsfOwzfkSpwsKiV0/usDD/3oDohOxSaH6Z3+86qkOXr2lA78
	Bg2/rmuDEzwZGYmhQAnJqRBvbM9kkVZIEpvcqQOLrzngQuTvvRVDgoKKyPWaPTrBR3sPTUj0VWg
	ir8zmNvkms33+H4RdUjuUiscERhBXDp6qYMvm6sRLjqoJJt/9frDHrB5YKTLS5sGgNIQnntnbQE
	YNCHC/S5DweuiOTF5e/qacIPjWZdxg7svMtapLpmSS5OoJ5LqWAqLQ10zOFGUFIkmyBDTG70Y+5
	jenoCho4xLHT1CI1I=
X-TMASE-XGENCLOUD: 70644e24-df31-4898-bcb5-de67630f9af3-0-0-200-0
X-TM-Deliver-Signature: 5CB641231DEF13A0219DCB3B4BC90DC8
X-TM-Addin-Auth: sAVBmkeUhqnIx9G3Ib6M8u+W7YX8v1MDXCRJRMOrkp7qd177ANpOiyvWO9B
	FDTpPVS5KjiF8nxkmrGyUlAn4iBnKCe5/Se8EEPd2HMO+maNJ09OCEdVTTDkGp6skDt196enTjw
	FRjN6V+2ZPJU2ajx33aE8Gkuvc+xP8PQHiqOr+0PhfuZfNPPjALQ0Tu7cV7+o1GK0hdPuLCE8c/
	y4MP6gmi/gbp9IbQlsi2OkKEJPLowA06Ly5zlL8eTVA4TwpHdbIHAACDF0uyBd7nX4niMFZsTOv
	acQO+ogAdBhG5MQ=.vxtaRU5lbB2y+eENbPgcL1PFmNt/AL7xAJI059T8bB5UNdvui/Rt68T3Kx
	m5pk8NIDac6bZSUnELut1wXclfKse2NNfAxqNo70XflyvVRITuhCLTS1Jq7M6SKwNEBOxtwBMt9
	7V7Si1wE0klJUpLHZVKJBOPodO5T2QbivBmL/V4Lwm3gHs4XdBtDBHB4uCSkIJXA9qdFw6uB9B2
	k2KAQpHPT9gPyDhn+aefjhtbMyurv39bBm+6rzxbDsTvPwYpMkWLvj1inqQKI6ZUAyE7JNoayYr
	BV5xz761SfN4dWUkMm+A2FM8wN/+W5bVowagGhE3d9J4yeOH6zLj36LVoAQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1719496206;
	bh=NulQ5/NTSVlXGlFZgJd82IWWk9mJ/RoAmgU6nVcH4YU=; l=2285;
	h=Date:From:To;
	b=pGPCssMkxkFdnevxh8KMQjSh3zCBnAe7IFsGx7XueCX/KYbX1pYxhBB0+p9ftLXf2
	 vQZzJqSBxiAG68RUva814kVxJi9SP0Jn0InLMFSHJM4DkEZB8iwCsPptxD8L7pK6Yw
	 CMRWgC3D95o5QKyZFi5keWcSOc40AEbXuhzggSnvBe0eoHsNMb0TyHaOcEzsT8yhDZ
	 +b5APFtzlYkylpZnLfsGnlcWYNYj5or57a+J7EbsPv7Pk5dAMM3Ch/5OcwplnpzVu6
	 BGYUHvxyL2ZO7VLiXiZsvRWfrZArn+5WTXuEqayz7b9QjT7QfnoryrhLsuaT6rGfGI
	 1Ygh6ucC+6rZQ==

On 21.06.24 10:45, David Woodhouse wrote:
> On Thu, 2024-06-20 at 17:19 +0100, David Woodhouse wrote:
>>
>>>
>>>> +
>>>> +       /* Counter frequency, and error margin. Units of (second >> 64) */
>>>> +       uint64_t counter_period_frac_sec;
>>>
>>> AFAIU this might limit the precision in case of high counter frequencies.
>>> Could the unit be aligned to the expected frequency band of counters?
>>
>> This field indicates the period of a single tick, in units of 1>>64 of
>> a second. That's about 5.4e-20 seconds, or 54 zeptoseconds? 
>>
>> Can you walk me through a calculation where you believe that level of
>> precision is insufficient?
>>
>> I guess the precision matters if the structure isn't updated for a long
>> period of time, and the delta between the current counter and the
>> snapshot is high? That's a *lot* of 54 zeptosecondses? But you really
>> would need a *lot* of them before you care? And if nobody's been
>> calibrating your counter for that long, surely you have bigger worries?
>>
>> Am I missing something there?
> 
> Hm, that was a bit rushed at the end of the day; let's take a better look...
> 
> Let's take a hypothetical example of a 100GHz counter. That's two
> orders of magnitude more than today's Arm arch counter.
> 
> The period of such a counter would be 10 picoseconds. 
> 
> (Let's ignore the question of how far light actually travels in that
> time and how *realistic* that example is, for the moment.)
> 
> It turns out that at that rate, there *are* a lot of 54 zeptosecondses
> of precision loss in the day. It could be half a millisecond a day, or
> 20µs an hour.
> 
> That particular example of 10 picoseconds is 184467440.7370955
> (seconds>>64) which could be truncated to 184467440 — losing about 4PPB
> (a third of a millisecond a day; 14µs an hour).
> 
> So yeah, I suppose a 'shift' field could make sense. It's easy enough
> to consume on the guest side as it doesn't really perturb the 128-bit
> multiplication very much; especially if we don't let it be negative.
> 
> And implementations *can* just set it to zero. It hurts nobody.
> 
> Or were you thinking of just using a fixed shift like (seconds>>80)
> instead?

The 'shift' field should be fine.

