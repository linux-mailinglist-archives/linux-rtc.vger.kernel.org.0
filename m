Return-Path: <linux-rtc+bounces-1437-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6955B9241D7
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jul 2024 17:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9CF1B27102
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jul 2024 15:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC9B1BB6B4;
	Tue,  2 Jul 2024 15:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="lw6CE8M3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361B21BB68E;
	Tue,  2 Jul 2024 15:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719932650; cv=fail; b=Qa7+FTbegwDJt4vEUZJawjUzi0yZFuz9yvmp4wQfDQVQMtBQ2/KZ+yppEGNexkwIr84ToDB5sCbHDenXAi6W44m4UhlWxeUWZsFVBzZ/pVkaBBDkTDU8nxK/ZDKaSwYL1TpmxjT3CjJ786sjFjfYB+X2O+0dV40/SbWqI1qghEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719932650; c=relaxed/simple;
	bh=kmz+dcNQIAud3wuJz6lXwfF04V8glRD7vDov6osmI5M=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MoLOqro2KPG1HLameUiP+RBUQ/xKARNKMv5SRGXWn76ZNbVcZE5SeOLWi3+pG0l5KVs2aX05Yjnj4fLcLRcNAjm3MjShrFveYYchrupIrP+ZtQyBViMFuUwKg5ORZeiyA05xdZJHkBN6I8HZwdLGtkLs+PzY9kjKYYgm8Cg428w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=lw6CE8M3; arc=fail smtp.client-ip=18.185.115.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.1_.trendmicro.com (unknown [172.21.193.255])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id E161410000E32;
	Tue,  2 Jul 2024 15:03:59 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1719932639.205000
X-TM-MAIL-UUID: 8629fd30-7bc7-4dbb-a126-f800afad4ed7
Received: from FR6P281CU001.outbound.protection.outlook.com (unknown [40.93.78.1])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 323CB1000031E;
	Tue,  2 Jul 2024 15:03:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0CkrJc1BnMP18xKBhUgWiQR5cCkJVLKDwKfIacjLgvTB4qsHNruYddqPhFtLbQ/9mPg3Ljqhy7BGpLZlMN2mP43L3sD5AJnpzjwHNovJuOT5/ZC3IeEJPzZD+hiIhZoReN2UdcensuUND0FYdOT58y5cvyKapBTIHLUmsW0qUByFNcFDyzao9uJT6VOxLe4KM+XIcFNiVROjbLyR7tyKyrspPuKsZElu3RtApax1JAPuOZK+zEPi+JWwM9f/MxEqnrvq23KhuUIBjywol17bZiMgtmhwwRSKtoXvpf9GQUXnLwsjtMug2gyPt51yyp1oRrTGaYMyoCbPVSTXuVYfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zny/rP90cpi8rVOgJaeX1NucMXOMuxoHwLN7T6uvN3Y=;
 b=b9K446EZm478+ZbSU4zKZ4NuOJjSORr+K8Y/WUO/V0hNR0duKRcIekBaw7y+2UFls1IPev7p7/wXAS9ebfusDxOBf5TfKXurtM6zCBqG0L4bpmaNpi3FGiisD2RPjErU7RnyncCQ18N4ptRtuVWmL1QbyGh1FBHXdZz1MSZu2uJN/vik8xIW7HtKoI69twRnhHAp/tlQ44mRh9r2v1vKf9/5QyNoSqyfR3NWSLI3sk8AOiEkUH2cUU/pjpoZFRrjlshaoSt7cg/QeEBHehf+YMqKTZk4zrx8Pqvh4mtOyljVE3Rb1LRK1Xt9P5fhAhN+jwEdpjMeyu3jDXtByNuxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <cb11ff57-4d58-4d47-824b-761712e12bdc@opensynergy.com>
Date: Tue, 2 Jul 2024 17:03:56 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
To: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>
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
 <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org>
 <8d9d7ce2-4dd1-4f54-a468-79ef5970a708@opensynergy.com>
 <bdcafc76ea44db244b52f8a092287cb33950d5d6.camel@infradead.org>
 <db1113d5-a427-4eb7-b5d1-8174a71e63b6@opensynergy.com>
 <c69d7d380575e49bd9cb995e060d205fb41aef8f.camel@infradead.org>
 <2de9275f-b344-4a76-897b-52d5f4bdca59@opensynergy.com>
 <BC212953-A043-4D65-ABF3-326DBF7F10F7@infradead.org>
 <51087cd7149ce576aa166d32d051592b146ce2c4.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <51087cd7149ce576aa166d32d051592b146ce2c4.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0304.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::11) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BEZP281MB2502:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7f27ca-5ba2-4f9b-bb51-08dc9aa83263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVF4OUEyS1NDOTltdnZYTWRQTG16V3ZqajFNTFdKbjZBR0JURFI2TW5IcS95?=
 =?utf-8?B?M3RCY2ExNkgyZXFTaVFhZG1ZR1R4TjNJZWhyb2pqeU95MEtqQmQzK0ZRL1l6?=
 =?utf-8?B?Z2d4allVdTdHLzhveFBCMUtPdnZvQTJWdGcvTmhyM1JmR2UvNzVwdFpuSUw4?=
 =?utf-8?B?TGVNak1kNnMyMlgwd0QrdEdmRkVvNTRGTTJOVWRxM0FqbEpJT1RBTGZtN0Zt?=
 =?utf-8?B?NmJOckNtQjIxK1BTNXRMWGtJVTRxR3UwY25VSDJlb3VJUXJMdVYzQ2FXMlV5?=
 =?utf-8?B?L2IvNDJLVG9DODlFd2Q0NnVYQXBDdU84WVlnVkFIMlRLUWhiK0I5d3BrdWFq?=
 =?utf-8?B?dEVNaHRocExxaWRLb1RIWXFKeHdXM2R1N2l0b0JoZzdZNFQzYitRcjRaQ1Mr?=
 =?utf-8?B?TmVvVURDUU4wVWNIdWc1MHhia1IreUFMRzlOVHE5Zk40TFgzeXVCZkxIWWor?=
 =?utf-8?B?MzZlNHJ4dTI1Ump0MU5XL3J0NkJYUVc4OVdBbVNCVU1SZFE1V1RnaVBDRmpW?=
 =?utf-8?B?Nm5qRld4bHdGVFB3ekxhU2pVaERyeHZXQ2xzdVg2OTBMRG80RGZmeWo3MEE3?=
 =?utf-8?B?MitVRm5RdVJXU2QzMmJGQkxsY3A0MGtWdVVsQlpxQW5CbDBiT0UrSzBDRDE3?=
 =?utf-8?B?aWpnd0w1L0NGZDBSQzJaZFVFemN0VFdVbVZkcnRRRlNWMkN2NUYzSW1xMzZw?=
 =?utf-8?B?YkpwUDFmMFFERTF4T1JTK1ppRHVqQXN5d29KTDIrenQ5RkhDbjBoMElLRXgr?=
 =?utf-8?B?UCtzSWk2NFZVdVVVNXRSRU1zWUJhSlBGNlBsQU9TMWphVnNKZU43SGpMS1ps?=
 =?utf-8?B?c21FUk1hVmxWOTh2Y3c5b3YrYkxjUTRuY0hPYzIzU2VlU3VKdis0NkhZREI1?=
 =?utf-8?B?bitSZytSSmU5TGFiMXVCUzd0VTZsZGhoRUJ2ZER0YjlQSnVMTDQxeW9FUFM0?=
 =?utf-8?B?U2pKWjBOSlVOdFdxTUNOUlhieXE4V1AwTXpKTnk3VkxISjdUUllDMjZFUDhx?=
 =?utf-8?B?Y0wrYzZBVTlEMnhIVGxaMktmUzBhbFJIcndoNWozVm9ZWjNKRHVUZ0ZZajJP?=
 =?utf-8?B?Q3RuenVxeDNxN2M3MkM3V1BORkdqeEJNMlFSelJqMXFaMDdmd2I1b1VQL2RQ?=
 =?utf-8?B?MHg4QWdsc0JtRXdlb1ZGd1I2VmtkcVJmMm5uQVErTm9sVUFvNE1VbTlCQVdq?=
 =?utf-8?B?WUd6bmUzczNFa21xMVUwdG44N2J6VkZRVHVGQUE4eXJDQkFXbEtqdkJESHJu?=
 =?utf-8?B?VzQ2aTZtWlZKVDhDMkdnRWhLdUNMRklGOUpjNXZHbDVUc1NPdVVsVW1MZlVR?=
 =?utf-8?B?VkswdkYvdlFPdVd1eHJyYSsxTFJCL215bVNRQ3pSaUFBVkk5VzBOenlrcEtS?=
 =?utf-8?B?VmJMQlJNMTNnTlRUR3BiZnhkZ3FwdUp1WkZEYVl1dHpuWWRpZGdaTS9wbnM5?=
 =?utf-8?B?Z1I5dFNxeU4wRW1RQURxSXNxRldJT1QwOEc3SXVmZE5PUUhDV0w4K3IrSWo0?=
 =?utf-8?B?U0RVSGlsaXZPM0J6NFJyNWFjRlpxTUp3NlVZR0tjOVMxeUxVc2xsOEdtYm9m?=
 =?utf-8?B?aU1oMThucjE0NWF1NkhVUzZrQmpVUUVoakptWEFQUm82U0V4Zkc0OXNTWEFl?=
 =?utf-8?B?MjFOUGN4NTlyRU5MaWwxeWNOYloyQ0R2ejBqYjVMTGs4S1pocTJIdVNxOXU5?=
 =?utf-8?B?aFIvWWdUZlE3QnR2NVdKc2NTTXpoSWl1Q2V6d3llTE82UnlYZUtidVNvUjVl?=
 =?utf-8?B?SnlSYi9tdnNWcUUzMGVsYUxUL3UzTHF5dWhDTVNCektkWVVlcisrV2ZIUlJS?=
 =?utf-8?B?U3gxL1hTd2NtSWE3MmZLd3BCaktsK2VmdUVvTDVpK29rdjdRYWlLYkhaR3p2?=
 =?utf-8?Q?r65slZWje1HNy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0d4ZSt2MWFBYVlBZVZpakFiY3lGd3VidGNSUnpVVlBGMklqK2ljWFQ3TXh2?=
 =?utf-8?B?M2NQMG5vQTBRb0UxVWhWc2pYcGNDTGhxMXBtNkx1OFRFaktyanU1TStVN2ox?=
 =?utf-8?B?YUp5b24xYnJZeTFVSVBvUEdPdzM5WW91RmVCRkVTK2JzN05qc0h6VEJ5MTZQ?=
 =?utf-8?B?WForQmVCMHBvenJjL0lVTmpwNW95K0NaZlo4aVI2d0duYWdCc3ZUczFVcEVm?=
 =?utf-8?B?Z0hIT29rOW5JSk4wOXJyNXI3anZHU3JKSkptZ0hEOFRFTFR0WUh0RFBwVkpD?=
 =?utf-8?B?UHZzR0FXdlhVVFEvRE03Z1B6M2tsRDJkOFQxZmo1ZFZWQkxLS1hDQlltdlV4?=
 =?utf-8?B?TUhuT2tjbVArdXJ2Z3ZROHUrd09rWllSdEhSR0dUN01sNFMzZ2pHOVBabldo?=
 =?utf-8?B?OUJoN3M1QmdEVUVYVEhGT3N6V0FDbDhNTmlocTM2WWNNODdmTDNFOWpXLzNG?=
 =?utf-8?B?SUhsM2dXVlBZd2xXODJGZ0lheUl6eUxCbERSRUZQcE1TYVdiN2JQWUlLbEo3?=
 =?utf-8?B?L1NQNngwUnp5UEs5Mmt5QVczdzYvaEZuQjg1NTZUMEh0Y0tvY3JXWHBBZmxQ?=
 =?utf-8?B?SEhWZ1MxWVRISnFwWWhtUGFQQ2QrK09DaXl5MisxcDZRcjY4d2hmdHd2K2ZZ?=
 =?utf-8?B?QjRoYnNKR1FyY1FyYmQ1UXNwVEorVDBTSEgzbFk2TXBJQzUzR0prQ0tnb1pt?=
 =?utf-8?B?LytDMUZ1OUZMZGtJcWt6NnRHdHVnTXN5VnFpc1FUUm9vT0pRK0F1NTZRODFR?=
 =?utf-8?B?STdpRmRWU3IyR3ZSdk5mTmdDak5wbDJaMlg4cDIxbzZkMjFGS01yeThGcWJh?=
 =?utf-8?B?cEx2QmpJa204eHE0UzNJM250aEtsUW1SUWpaWUVYUXYxY3puV2ZJWXpEOEo5?=
 =?utf-8?B?bGxVMnRiNXJPQlJoNWZWVUE1cERKNi94SzNyZmwvS0NJSmY3WG5va0pHQzl4?=
 =?utf-8?B?endWUGg1ODc1UDNEMXhLR1A1L1V4WXRzVUVwSTFwa0VTc1FQMjNQLy9NL2N1?=
 =?utf-8?B?MEpUNzhNTkJGMzJwMVJ5WHZ5aGlQTi8veXFDOHQ4ejZmTFVQdDM2NDBIMmow?=
 =?utf-8?B?cmpyRUtOZGs1WmNJd3Z4YlBqdVVJd3VOVkE2Zzh5S0VRT2VraXJPYXd4ajBN?=
 =?utf-8?B?b3RlOVpCcFlzOUNuRnVnOW5rUDk5RUtURlJMUk9iYnlWL1hwTEgvWFhMZFgr?=
 =?utf-8?B?N1BGd3pmdkJwbXpzVWp1MlVYODVUWkFobXBtem9lQkhKUzRTVmJtTWRFR3o5?=
 =?utf-8?B?S0ljL2NTRVFKdXZtSjBDUXpHVGpKZ2kvK29zQ0d6cVdvZGgvQ0plT1hmYUcx?=
 =?utf-8?B?ZXVqN0ZnaUQ3U2o4b2NoLzNidUt0TjNkTTRjdXdZKzRTWFlRSE4wR1I4QnJl?=
 =?utf-8?B?V2lDODVhbUlBUkNEanZNWU9FMGZqejNtWlJaSjdYaXNVbnZ6SlpKWDE5OXc1?=
 =?utf-8?B?MkhnUlZSUVpIVDBTRzJPVk4rMFJXb3AwaEgxTkVKbSt0d0ZuNG95blp1M2o1?=
 =?utf-8?B?VmJTb3dKR3R4dE9IL05ZUUQ5UVdWOVFZWkdxdGw1enBuczhzMjREV1RKSEw5?=
 =?utf-8?B?dlBVQ1ZvblhDc0Uwc29Pb1pCWDBweGhXZm96T2ZqL3h2WDRmMVBjNDFtTzls?=
 =?utf-8?B?N3h3UXU4VkdaNytURDh4N2d4cVNwczZRU0Q2VnBWZ0s4ZXJEenFNVTduVi9H?=
 =?utf-8?B?a0NiWEZ1SVIvdWNaQWp4eEtQZVVqU012dUJEMldiZ0xsRWpZK1JHZkVNSjBX?=
 =?utf-8?B?ZHljWU9oZ1laTyt6bjBuSWVNaVF1QVBHYXd4VVFUR1BlQmNiaXU3c2xsdGhq?=
 =?utf-8?B?a3h3MzdMOHBYRDdHMVRyVVI5WHZNODhIK0I5b2pRY0xhN3d1VGsvQzc4ZHdh?=
 =?utf-8?B?ZzFmQ2pkdUt1eTlpeVdqa0pDeGhXY3hPenoySi9VSFFiMjA0ekNobjZMK3Vn?=
 =?utf-8?B?M0M0MTRKd3FuclhNQWdkVDFCV2dSMmduRGxaUlRsSy9VN1FQalZUV05LMTAx?=
 =?utf-8?B?d0ZLNE1PMVp6bis4SUgrOFMrQW9WYncxNGcxQzVOWnlrdXVzRUJYZ0l2Nytl?=
 =?utf-8?B?K2ZUaXdPTDRzSGxSU2w1SlV0Slk0clVRdW9jNENsZXpOaFZ6bTl1QWhkUnZY?=
 =?utf-8?B?WXYvYXRWdi94a3Q1SGFnNkZkYTl6TXpDL0grWkQyTXFEUTJIWVRENlY5ZVoy?=
 =?utf-8?Q?Tn9cnifOQukce1/2fCxwzyAsquQ7szs9Z5S79D+PGDob?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7f27ca-5ba2-4f9b-bb51-08dc9aa83263
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 15:03:57.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOjx6uvCjDLgCjuYsvT/3+k+MkI1p4k+Z5mxDNAjSl/FmqBTpy6ieQD5ndQLAdkZIG2dfNU+G2ZPb+Fn66858w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2502
X-TM-AS-ERS: 40.93.78.1-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28500.002
X-TMASE-Result: 10--15.332900-4.000000
X-TMASE-MatchedRID: qsaWi0FWcYv5ETspAEX/ngw4DIWv1jSVbU+XbFYs1xKOGg51f50an7Iw
	v5gCU8doFV5P7J6vD8V42Z4B+7Pl3FD34UJ1p+WwPIAEWj78ztZNMNY2L2K/D/yOIGI0xdiWoMT
	B0w5kCEmmX/tHe8XUp+Tvok5Eppmxqu6mMiHAZanHwJYnpo0L6RWhK9n3L3nuTlSOM+BNiL4ywA
	9RKGrQyzWVB0HE7lH/5MleMRAioZKfZHPhoNvhZiE8raaf46xMm8lEjXZMqs7IMvX6SZxdTPpEr
	iOJ//78QcFdvzpCH8lza11jIl0+2vFoqE99wfE/DXu9xcI0Ll/l/akqBj9zTUkU8FyBiYUiPKIM
	uCDhV+0L8Pn8NeDCYtXXJWuPq3fNixjkew1wtcZcB5L7DliBJS+ckrkAB5mQpFcuHYtFCBQJ9Bd
	4cjKjH0/IE/EN3EiUvICSsXhD5wGEg4w6d+d07399+4rpSPA959KGlOljPvtkOvLryF1tXtabQy
	TTNN0kYpsKAPglw0QhuoV28BfgFKU/2ruavVUm4WMcbQqR5OFSM6qNRfMkEtbojhKG7WOq6KEJO
	7SR6XgkvJFrsDh0h5XWHqKOxvV4rQDJT+IEXRYk+VN5SeE/CqWtxA0qDTb0iZHHs5XulrPcIfZk
	2P1epRa07LN/AvzGWjsaYI4lh3W+IjsEEOIzYnYj8RCvodvSoVej1FnC0xSPeibXL3crHSjvQJR
	tGuSb
X-TMASE-XGENCLOUD: 3840e62f-8ac0-47be-bfbc-2a2ba906b054-0-0-200-0
X-TM-Deliver-Signature: 51B9A03AD2652AF557389A14AC9687BE
X-TM-Addin-Auth: HEOEWup6O5zFhkyslbd5us2Q5wzoVEl4YyNiocjB3R5y582qHTn40nPpJsi
	9jVyT5+BOdL5JVaUmqmtSMNitU4kW455TJohzEtg2uCqiRmIZVkJpZFviFgZ/dnUB3+AOt/meIP
	fkppZQpV5tWCZIxySzT6QGfHbAmPauyCOgdFAJJ9uIg1p9GDEzrc2k6DSI4lhsFiSgRZ7x3m77c
	6HnDDnbP4zTo3rZ0GL+AEZ/4h+ApuJre35OdGfh2wRPWhLUe22lR74c49mImRLBxYt0MBmXx78n
	tiH9f+X+QTCe11Y=.B0KaWfsIGhKZnSxC7xNMHVwRdeaN0sAJRPP41xrRJqlaD+ZF4z+BfuPWxC
	Sa9WxKiweKQeGJRG7TXBDW23YPdisyFfrKJUI01+Jz/P+gac49sa53rfI9tu6YnJ3SdmlBVmabW
	vy//lWNPOyloSZk8ocgS0MEdQK4mJkVp0NASx2IByZ0PW3ZDO9mwKN5fFsY2dYvY4IU5EviyJ6X
	8YHAypKX1UATivIkSElwO1FPjlOe63FRRkVLBK0SFa7fa3rQjCurP+m7voiDgTSAGKo4/UKc2hH
	YJKCsf/YedZnxnpSWreBsjIWwhtgM/LUPy6l5H/qZC0FL/mqw98SYyhMH1Q==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1719932639;
	bh=kmz+dcNQIAud3wuJz6lXwfF04V8glRD7vDov6osmI5M=; l=6385;
	h=Date:From:To;
	b=lw6CE8M3X0ZWcAGwSsKy0Ss52J7sFAkYBRZKWPY45EpuAOn7AW8tMt/oUQEbktQQZ
	 WyaU1cCZADEhmYSK+Pp7WrZ4VAdm9nI14Bkw6YjrCuJQsG497GHHDyA/SpP0ircWGm
	 dVPV4Ddw+bxSfs3RWUnoRWalOxnF/BmuAXkCODFgdvgn1wnSuXf9eNclnlqbpUwQ/c
	 bcgx1Yxhgxva6mjuMX3udAwLSSlwdsHFYBvOMtntdU3Wb2xGELcCqs8DtsY6stb35K
	 J36lAKQKlPEuvL7NEkUKmUrzxuq63dAsv1cOFnk19UqR/j+QsPATh23THXOlNy8XM/
	 ViqK4EtyhCWEQ==

On 01.07.24 10:57, David Woodhouse wrote:
> On Fri, 2024-06-28 at 22:27 +0100, David Woodhouse wrote:
>> On 28 June 2024 17:38:15 BST, Peter Hilber <peter.hilber@opensynergy.com> wrote:
>>> On 28.06.24 14:15, David Woodhouse wrote:
>>>> On Fri, 2024-06-28 at 13:33 +0200, Peter Hilber wrote:
>>>>> On 27.06.24 16:52, David Woodhouse wrote:
>>>>>> I already added a flags field, so this might look something like:
>>>>>>
>>>>>>         /*
>>>>>>          * Smearing flags. The UTC clock exposed through this structure
>>>>>>          * is only ever true UTC, but a guest operating system may
>>>>>>          * choose to offer a monotonic smeared clock to its users. This
>>>>>>          * merely offers a hint about what kind of smearing to perform,
>>>>>>          * for consistency with systems in the nearby environment.
>>>>>>          */
>>>>>> #define VMCLOCK_FLAGS_SMEAR_UTC_SLS (1<<5) /* draft-kuhn-leapsecond-00.txt */
>>>>>>
>>>>>> (UTC-SLS is probably a bad example but are there formal definitions for
>>>>>> anything else?)
>>>>>
>>>>> I think it could also be more generic, like flags for linear smearing,
>>>>> cosine smearing(?), and smear_start_sec and smear_end_sec fields (relative
>>>>> to the leap second start). That could also represent UTC-SLS, and
>>>>> noon-to-noon, and it would be well-defined.
>>>>>
>>>>> This should reduce the likelihood that the guest doesn't know the smearing
>>>>> variant.
>>>>
>>>> I'm wary of making it too generic. That would seem to encourage a
>>>> *proliferation* of false "UTC-like" clocks.
>>>>
>>>> It's bad enough that we do smearing at all, let alone that we don't
>>>> have a single definition of how to do it.
>>>>
>>>> I made the smearing hint a full uint8_t instead of using bits in flags,
>>>> in the end. That gives us a full 255 ways of lying to users about what
>>>> the time is, so we're unlikely to run out. And it's easy enough to add
>>>> a new VMCLOCK_SMEARING_XXX type to the 'registry' for any new methods
>>>> that get invented.
>>>>
>>>>
>>>
>>> My concern is that the registry update may come after a driver has already
>>> been implemented, so that it may be hard to ensure that the smearing which
>>> has been chosen is actually implemented.
>>
>> Well yes, but why in the name of all that is holy would anyone want
>> to invent *new* ways to lie to users about the time? If we capture
>> the existing ones as we write this, surely it's a good thing that
>> there's a barrier to entry for adding more?
> 
> Ultimately though, this isn't the hill for me to die on. I'm pushing on
> that topic because I want to avoid the proliferation of *ambiguity*. If
> we have a precision clock, we should *know* what the time is.
> 
> So how about this proposal. I line up the fields in the proposed shared
> memory structure to match your virtio-rtc proposal, using 'subtype' as
> you proposed. But, instead of the 'subtype' being valid only for
> VIRTIO_RTC_CLOCK_UTC, we define a new top-level type for *smeared* UTC.
> 
> So, you have:
> 
> +\begin{lstlisting}
> +#define VIRTIO_RTC_CLOCK_UTC 0
> +#define VIRTIO_RTC_CLOCK_TAI 1
> +#define VIRTIO_RTC_CLOCK_MONO 2
> +\end{lstlisting}
> 
> I propose that you add
> 
> #define VIRTIO_RTC_CLOCK_SMEARED_UTC 3
> 
> If my proposed memory structure is subsumed into the virtio-rtc
> proposal we'd literally use the same names, but for the time being I'll
> update mine to:

Do you intend vmclock and virtio-rtc to be ABI compatible? FYI, I see a
potential problem in that Virtio does avoid the use of signed integers so
far. I did not check carefully if there might be other problems, yet.

> 
> 	/*
> 	 * What time is exposed in the time_sec/time_frac_sec fields?
> 	 */
> 	uint8_t time_type;
> #define VMCLOCK_TIME_UTC		0	/* Since 1970-01-01 00:00:00z */
> #define VMCLOCK_TIME_TAI		1	/* Since 1970-01-01 00:00:00z */
> #define VMCLOCK_TIME_MONOTONIC		2	/* Since undefined epoch */
> #define VMCLOCK_TIME_INVALID		3	/* virtio-rtc uses this for smeared UTC */
> 
> 
> I can then use your smearing subtype values as the 'hint' field in the
> shared memory structure. You currently have:
> 
> +\begin{lstlisting}
> +#define VIRTIO_RTC_SUBTYPE_STRICT 0
> +#define VIRTIO_RTC_SUBTYPE_SMEAR 1
> +#define VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR 2
> +#define VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED 3
> +\end{lstlisting}
> 

I agree with the above part of your proposal.

> I can certainly ensure that 'noon linear' has the same value. I don't
> think you need both 'SMEAR' and 'LEAP_UNSPECIFIED' though:
> 
> 
> +\item VIRTIO_RTC_SUBTYPE_SMEAR deviates from the UTC standard by
> +	smearing time in the vicinity of the leap second, in a not
> +	precisely defined manner. This avoids clock steps due to UTC
> +	leap seconds.
> 
> ...
> 
> +\item VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED may deviate from the UTC
> +	standard w.r.t.\ leap second introduction in an unspecified
> way
> +	(leap seconds may, or may not, be smeared).
> 
> To the client, both of those just mean "for a day or so around a leap
> second event, you can't trust this device to know what the time is".
> There isn't any point in separating "does lie to you" from "might lie
> to you", surely? The guest can't do anything useful with that
> distinction. Let's drop SMEAR and keep only LEAP_UNSPECIFIED?

As for VIRTIO_RTC_SUBTYPE_SMEAR, I think this could be dropped indeed
(resp., UTC_SLS may be added).

But VIRTIO_RTC_CLOCK_SMEARED_UTC is an assurance that there will be no
steps (in particular, steps backwards, which some clients might not like)
due to leap seconds, while LEAP_UNSPECIFIED provides no such guarantee.

So I think this might be better handled by adding, alongside

> #define VIRTIO_RTC_CLOCK_SMEARED_UTC 3

#define VIRTIO_RTC_CLOCK_LEAP_UNSPECIFIED_UTC 4

(or any better name, like VIRTIO_RTC_CLOCK_MAYBE_SMEARED_UTC).

> 
> And if you *really* want to parameterise it, I think that's a bad idea
> and it encourages the proliferation of different time "standards", but
> I'd probably just suck it up and do whatever you do because that's not
> strictly within the remit of my live-migration part.

I think the above proposal to have subtypes for
VIRTIO_RTC_CLOCK_SMEARED_UTC should work.

