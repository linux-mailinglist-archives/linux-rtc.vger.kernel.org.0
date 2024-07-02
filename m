Return-Path: <linux-rtc+bounces-1439-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D213924714
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jul 2024 20:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C692328484B
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jul 2024 18:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6310E1C68BB;
	Tue,  2 Jul 2024 18:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="xagwIUN6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8621C6890
	for <linux-rtc@vger.kernel.org>; Tue,  2 Jul 2024 18:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943928; cv=fail; b=ukB6G65PgAYDy5jFvbQ1WxMmgBW8X7saew3gxZjEpzhoPTg92s5bj013P+HhTwDX5Skm7p/skZ6MjplIOxqqKEoLZccbfkiGYtAT5JuRKac5f2KGrrXr5UHNX3nqEbSpSk8bW8r5nE5H0VZwBz8uPUScH53Ik99ndHgCq+Qoi5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943928; c=relaxed/simple;
	bh=/1RyhdWuhE2h/M6ptVq5HifNqDe2FP6rXIqHX1WQJXk=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FFTHHy+jX4kVsRqAU9F/9Jq5Jr/dgxf1A2GRDvZ4MKtGcTfd1iJZ8/LNIND5m7qG3jkNMDNhSD5gTw2A/pENivvI/lAMwvrnw9hg9IDyecwhzDNAYw8mJ/PqHvbbFV2BUaf57zpxN+2pAU4xLRGc/aY52tKVD5zWqnSpV27LTAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=xagwIUN6; arc=fail smtp.client-ip=18.185.115.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.51_.trendmicro.com (unknown [172.21.186.216])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 2AE7810000E24;
	Tue,  2 Jul 2024 18:12:04 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1719943923.409000
X-TM-MAIL-UUID: 9b1658d3-0e1c-44c3-976b-68d4b06591e1
Received: from FR5P281CU006.outbound.protection.outlook.com (unknown [40.93.78.51])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 6432D10005BDE;
	Tue,  2 Jul 2024 18:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHx+FJodBH+qO25pxM5qiw8ceP7ZJ52l91m4l3N7NItseinwoE6olTK8Ege8vvrXz8xYjxQ0ixSjIZ63iCU24LmMAOm8JtAqGpO+5dVacKEm73p33Vnd+HdlCyVNUkLtX82PIMsUppZS42+oBDcTks3SsqG3l8//7l9NpAM7zbl7W08wPDeahhqZstuBUveAbuPczH44DpznNiQ2/wHBSnoba+rfCHQYuRBqMHllcL5lfLNDq+V8IhsAJMwr38VWKAxO9T//j6o543uznwHnoQwNaxywuftAF/yYyvA0m+LgH+V2FfV3JhZdpxhcxNg6RqWE6v6B1eTN7qk2bxMHqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuEkj3O24I1/3yz0THjIq4ZazNs8mpYjAk2QQdrPqSk=;
 b=O2j9XP4JwuQEnyXv+4hdnW0iVi1UIfidIgeX0gAATc+KKl1g6+QC9+vH+XEwN2YCQasnBzh377Efg+6HieuaxQ2zJEDDEgFN1Z6553S+B8erVVyUHe9DfTFpl5RprAN4fu1quMTs3aqQvWR7OsyPtj7fWjvPIM/vffTCygtLltFW14kZe+gP6UJb9sthOetB+tBqlJKe4ZvaG9mahdMBJ2+hI0U95z7sKXZsCe2uH/6Y43e7Jt0itlGCuOfrjOiBiwvMuTLW46fDomOocFShNZsHB+6nOn3/5xM5fgSNPc/2PIpEm72JRREPeF/qUT8wHxiaT14opZylvn/pNERbgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <19c75212-bcb6-49e3-964d-ed727da2ba54@opensynergy.com>
Date: Tue, 2 Jul 2024 20:12:00 +0200
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
 <cb11ff57-4d58-4d47-824b-761712e12bdc@opensynergy.com>
 <3707d99d0dfea45d05fd65f669132c2e546f35c6.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <3707d99d0dfea45d05fd65f669132c2e546f35c6.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0321.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::18) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BEZP281MB2245:EE_
X-MS-Office365-Filtering-Correlation-Id: e1324107-f65c-416d-3601-08dc9ac278a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzhuNC9WTWJmdmE4STFOOFhKNXd6cE1xaFZ5UWJad3BjMEhrKzhiQmhqaHJZ?=
 =?utf-8?B?NGpFdlJmdTB3OTJ1VGc1UmtqRlhTSDdSVGNyQndPZ3JGUDJBMmM0Z0JzZE1t?=
 =?utf-8?B?ZzhXQS9CT3huZ1dWVElVOG1BOE1rR01wWUtHaU54ZTJnOGh2aytVMmU2UlYr?=
 =?utf-8?B?V0FVcDQzM0NWc1duV0tqTlMrRTQ5WkF1K3k1VStNVkV1WWxhbEgrWEJMd3ZN?=
 =?utf-8?B?OHF4RHg0K1pFYW9NZ1Axd1Z5RHlMOU1GYlJRd0JVbWxma2tyQWNuOHRYY3ZC?=
 =?utf-8?B?d2NxcFdLWGJXemI5K2ZuRjVBU1hwWnJIV3pBdThJR3JoejdQTitiMkdsaWtW?=
 =?utf-8?B?emZ2RkFVa3p2VHZHUkRWNlRmbXJSNDRCREttbTJMZEFWTHRrNDh1ZlVmUVVi?=
 =?utf-8?B?c3k1WHh3Tmk3VklDa1pFWmZ2NmNrSFR6NkhYSjJwVEhuaW9YQkxzWXdML1VP?=
 =?utf-8?B?LzhiZC9PNE5qdW1GK0I3UGZIT2pMTjllalR1cFdZTTlLeWxDL3N0a1Z4cHY3?=
 =?utf-8?B?ZHROUkZEbVhaMVdoSmYzWitrVUhxZDZtZDJnbkF6d3EreHd3cHJEUXZoVVR4?=
 =?utf-8?B?V01XWk9HZHM0bnlpK2FXZi8wTDVBblZiS2NzcTRuRzk2MERKNnRIY3JHOWp1?=
 =?utf-8?B?NFF1cU9MQXZqY1lFOGtMSXcrWWVPdyswUzZzQlR1UWVXdXNGaitNQ2dqOWc3?=
 =?utf-8?B?K1hNTjZNRExBYWtHZDQwWmZBVXU0MDZGNjdpcmVvOWhYYkFtb1FMb2tub0pH?=
 =?utf-8?B?L3Ivd2pHR0kydnVSay9sT2tkWks0dEFqL0g4OTlDd0llM21NTTg2cHZVL2Z2?=
 =?utf-8?B?K1QrdTBxektDajMvWUp1TUo0N3Y4S2NHUStLS1N0VHJpd1hRcXVUKzJvTEpZ?=
 =?utf-8?B?Vk9qVTJ0eVViaG5oQVIvaTdWSDFWZnN2Kytoc0dxVmE0cG9ZNjJMdjV1bEcw?=
 =?utf-8?B?Nk1uRWQvRGpINk5zVVZSVTQyd1BYNEhzTUQ3d1B6VEFzelMwL1ZjajYzb2Js?=
 =?utf-8?B?VVN6Z0ZGK0ZnRTJnK0d1OVB0SUszNlYwTGQ1NWdLRXA0MEJBN09waXhVMllC?=
 =?utf-8?B?QkxuaGRWdDVOV25QalpjNXZYTitnSmdjaEtXYVJjSkZyOHNCbzJoT3VsWXl6?=
 =?utf-8?B?M0ltbXZqL3YvNGRDYmdyL0MwQ0xIUTJkVlk1M0dqelZJbXlxM0o1cSswV24x?=
 =?utf-8?B?bFNZbEJsUkJMcElDTWN3ZTY2bS9ZV0R2OCtCUGcrRmFNMmxEYktRaGFINE1n?=
 =?utf-8?B?ZnpZVzJyeGhJdk1CYytsaUVDYlB1MnRDejZrb0JmVnJmbWpTWk9pR0tBb2tJ?=
 =?utf-8?B?VnpJQkU1Ym03Q2trZnhtUVYvZVdZWHFqWXNGVlBkczF5WThmQmZ0Mkc2UkdS?=
 =?utf-8?B?ZjJUZlc3byswU1pjK004bjhlS3dBMkVLdUZKTCtRWldjVjYrbjdWT1RpSFFr?=
 =?utf-8?B?bWtZMDRaR2R4SStuWlhma1huLytxNndYYlBlM3RaM0NWZHhvTDhhMkNoQXA5?=
 =?utf-8?B?SGZ5UmMzalBLRUVBbjBaVDN2S2s4aWt4MnZuL0xvUkRSMHdPMkFmUURDUitj?=
 =?utf-8?B?RGNQMHB5R2wzOG1xSEc0Z3V4OCtVdyt4c3lDdDlQb21JVmJ6RENuWjYzUFkr?=
 =?utf-8?B?OXh1SmtrSEhFaTVsSFpZc1RCbVlYcU9CUFBQb3RiNU5NeG05a2lyOUhMd05F?=
 =?utf-8?B?MnVqS0lhWHJhMzljd1lOa3ZGQU5RbDVBWHYrc1BmMXd2cEdoeVE0c0ZvUS9o?=
 =?utf-8?B?YWdYVEd5OG5OM2FQQmhXTFoycFZFREVSY2w0Y1BxRWlBN250NDBhbEo3WkVM?=
 =?utf-8?B?MEE0WjF3aUpGWWZmUDM4RHB5OHR1ZFBLQUZOZ1k1MXRWV3dOM2NTK1JrSkU0?=
 =?utf-8?Q?OssOk3adNHaww?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHp5V1dJTWwzbnY0UWlJeko2dUQvd3dud1JwblErMFhqSmZuWk5WV0NZdlIz?=
 =?utf-8?B?WDBWOVNvNXU4U1ArVGQvZ3dvQlFuZTBYL3BaRlV1Tm5VQ2lJUkcxN2wxMTV5?=
 =?utf-8?B?UkQwcUNGV3FiS05oMVJwT2dvQ082NTliYUQwcUpHWTJwdnZmZ1BQQ1NkVmJu?=
 =?utf-8?B?c21oUmppdUR0anhGdXRlVEtCRlA1bVl6Zm1WQnBPcWZlYVhmVHF6cjNBbnVh?=
 =?utf-8?B?Q1Nyem1DcG9VR0NXUGx5NWZDTW1HL0J6Vm9Senp1YTZGWUlkUHNueVBQRU9q?=
 =?utf-8?B?ZEdad0NMbkNJMlV6M005MmhlRmppck1XL3lGZUpUT2dSWkdPRUZDVzRweWRU?=
 =?utf-8?B?azUyMjdiQnVhK3U2YVZwWUNzWjJaNHU4VVB1STV6UXRXRnByaFdNdW1kTDVW?=
 =?utf-8?B?dVFjNVVvdDhjcHJCZE1SSUtmOEV0NHB6eSs0Mmt1aDdxSVIxNHlpeFNySXV3?=
 =?utf-8?B?V3J4YjgwTWtLKzFGWVBLMFJMYW1TNUxHWVNER25HczRzcjVpYUdBcHBlRDhn?=
 =?utf-8?B?dnBlbUd5OGRpeDVwUDg4eUI4U1gzTkNIbDlhcC9UWEJ3SGhFUndhQ2NULzU0?=
 =?utf-8?B?MzZISkZpUlJNQSsxaXowUVVQNk1QRUZrQ1hYb2tyMFA4dGlhRDE0MUVXb1RQ?=
 =?utf-8?B?RkQrNSt1dGRDd0Z1clNjZ0pBdHdHUXBIL0JZQUQ5SEU2QWlzUXEvd1JsQm5j?=
 =?utf-8?B?VlRWSkNKSEh1UnRVSHFqOGMyMjEvZS85Q3VQMkQ1QTU1RnF0SGpkM1p1OUdn?=
 =?utf-8?B?RnAyNyszYzhiU0RxbVlaVGozc2J5MVQwbDAvaG94QjJjN0RtSzNXZjVpelpI?=
 =?utf-8?B?NTZkMFpIcXRkV3VWV290R3B3aS9NNnRVc25rL2tiQmNNWXZ1UUZuRGlaVjho?=
 =?utf-8?B?ZnZHaitWdmpUc2dYZXBGZXkwMklpcUJXMUx2WE5vOGpTOStPTnkrT1psejF2?=
 =?utf-8?B?Q3o4WnQxd0N1MHlGTWM1a2Iwd21UVUNUVW5abXFBRjRrUlRScVBXREV1c21G?=
 =?utf-8?B?WTZHaE1DbVlNZ2hkYTlEMlpwWklSYlp1Mm1tZDU4V2w0NUVZTlBYeENHRGcv?=
 =?utf-8?B?OVJGSVgxYjN5d2RUOGtubzJmUkxjUEN3Qmt5cGpRbWMxRVRZWThPaDVJWWZH?=
 =?utf-8?B?dkJFVEVpTGExLzhQNEdPWk5sRXJtMlY0SWVEdFNURVNQbkR1eS82bVk4MTUv?=
 =?utf-8?B?SzIyRStPZXJ4UElvd01Idzg5Q3lGMGUvNFR3OWEzcTM3cmphM2Fad1V1M1Jz?=
 =?utf-8?B?SWw5OTYwQU5GN2RtNDNmTTcrU3hhMkUydGtQOHFXRWpBb2dPdW9SVmIyUnhp?=
 =?utf-8?B?TzVISEZjbzhwWXh2dVlNNjFxNlpOT2RXS0pHNnBNbHlIdHBweWI2ckxMcFc1?=
 =?utf-8?B?aHdhdlJ0cmNhNlo5cXF6QlpWVlc5d2twaERzR1p3a0laSnI2R04reWtXaWh0?=
 =?utf-8?B?OWdRbGJvaldnTnhEb0g1QmQwdmZoR2Qyc3d6VVpnV01LVmwzUFREUGRFK0hB?=
 =?utf-8?B?anNRc0lpblZkMnBlYlRzL3Z3Q2ROK2ROL0pPNmFBbVBCellvcEZtOW95cklY?=
 =?utf-8?B?WTdjM3U2K2FORER0TERPbm95VVBUQStvL21XRjFPTitOTXV0c0RRaWpsaEU3?=
 =?utf-8?B?NVBkbHlxUVZLZ3I2RS9maGlaY2hlMFRhak4wZVRjUS9tRFlCRGdOVGFXd0JZ?=
 =?utf-8?B?YjNseUZiM3M3QnlYMmFEMDFraTZsbmIrakh4OXhmU3hkTFZyL1BrYzdzOVQ2?=
 =?utf-8?B?TFFTcEpoTG5McU03STRLY21XMk5JM3orWUpyWTExYXJVVndQVnhWS3ViTmFp?=
 =?utf-8?B?RjRaRHZYSi9UcS9UdHFkYTdkN2o5WnVNTFNtWG9FSW9NRllqTWQ5cmtrcktq?=
 =?utf-8?B?YlRwRkNQb3p1SGFZQnRzZmIyVzlxWWNiSXdjK3ZYRnovbDQvN0RraTBYR2My?=
 =?utf-8?B?eVhNQVFMODlxaXY4V3R6YzNBY2oyMm9aQ3FBU0toTTJXY1lJZXVFMjZtMkZX?=
 =?utf-8?B?N2ROVTVSa3lxWlltZ3ZnbG5ZV0NxbGZLamtQSHR6b2JReWZYem5BenBKMDdl?=
 =?utf-8?B?RDJ4Z1dtN1RFVVMzWVZDcmVHNE1ZcUx0aFFPaHZEZzcvcUxNcG1kL1ZEVk5l?=
 =?utf-8?B?U24va09aSDZvSitZck96aDg5eHZ6M1N1Ri9oVmpMMWc2djEranN2QXNKTE5T?=
 =?utf-8?Q?VRBZ6OIJ2Tc2XTLKtfg0tSV7tJ0DdUEW+BQ4HZ5X8BAg?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1324107-f65c-416d-3601-08dc9ac278a8
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 18:12:01.9376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tj4YGfjZeIacXjwqOsLab969WBbFE8nseGTX2kMX9JZ1uYjxiZMMOoN4cpJaMS9g0tUATY0yH1szObpiEDiCcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2245
X-TM-AS-ERS: 40.93.78.51-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28502.001
X-TMASE-Result: 10--21.682300-4.000000
X-TMASE-MatchedRID: ZFzIhWOuIzv5ETspAEX/ngw4DIWv1jSVbU+XbFYs1xIRU2V0pUrEuth1
	HxXdHsI8rom31Her2mfAaX2MpgGS385v+H7gn35I7hzwMwStqTsS5Hzh70YD4oo6vdFKcH6Ogbr
	9ms5C/Dje15dnDpkp2t3XCdWPo+xewmD/OoYb7ItcB5L7DliBJS+ckrkAB5mQi9dqe3GagVjNwE
	HRsS7DKnaxXrGAWyiSBvco4mEge2h2MDBkdqe8kIO2sppVKEGO7gd5SqHIhjIEo7RuIMv80CkSG
	6psrYlInL8fU/fu1hTWMgFUl++77H1oaxkqu7I4H7WbjGX5tkmB1fO2o4QGcM7uFDejoNiC5Eib
	31BWLes/LKCM0Y80j4jNdqqk+SlcXRJSl4ZYvKLGdq9RSTxjI80baotdQU5OS4l8zny2qZ70u9h
	BgtYHEzsmAXzvHn0kjHk5JhbV9uagwuHyu9UsLAvpq/ti8dx8EAcRQPO2TzjW6I4Shu1jquihCT
	u0kel4JLyRa7A4dIeV1h6ijsb1eK0AyU/iBF0WJPlTeUnhPwqlrcQNKg029ImRx7OV7paz3CH2Z
	Nj9XqUWtOyzfwL8xlo7GmCOJYd1AqYBE3k9Mpw=
X-TMASE-XGENCLOUD: 3423d488-40a1-474f-8f73-12947f7fc5c1-0-0-200-0
X-TM-Deliver-Signature: 2724CFDC703C590015F26FA2AC843870
X-TM-Addin-Auth: roIEs28Jp4JQo8QJkRs9LmVyOUlGjuBduFSDuet9fYOU4ODU0VF1ToLTHvt
	cEDHdhnkx4Iby6FfcApfsN+Iq7fUvHsrFCW0YH3k7MY2nLiOIcjMZFsbOCnLsJL5QQHLdQcfpIE
	Fy3fymxgcTfZ8QYh0z3DvKwvoMJx6GAB0X0oYXjhEF+VF+aRo8YI/sqS1fa+NQ1WKDISp9LjcNx
	GX/0JWhgpCil3SXOJv5LsxJcTtZmXzVABrrpE4BlQcTX4BK+YllifCbKfw7lYMITCu7dM+xUCr9
	7GKx7E/lx2fse6I=.CoG0pdLofuhpfiENnENDkvvOeus7R0yqZYDE9LOBodYLBHqlvo7TFx0iRW
	nhQJ5Hf+AoFCYWDGGVYNwr+hkZiaq03v7jWSd2UNOmKLMA59hH2nz14hO+0j0zsn01YzjE56UfI
	6oeYVccdFMyoiI/ppxKCO4qxox237yfFw7AwLJS1T6D9Qj95AEa0uErPE6MEyswx6tVjJstJv7H
	ljn9nirQySBcVvEI+Ay8IZGwj2wedmMENTq4842jhfRTr0+7FUx0mlzu3OnKxY6JZLN+aE2KXdT
	ieNxU7JYXDPUG3q49CG0G96DbZMya+8F05Eeh6/DS/vqqWzlPZYyAcnNf7Q==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1719943923;
	bh=/1RyhdWuhE2h/M6ptVq5HifNqDe2FP6rXIqHX1WQJXk=; l=6144;
	h=Date:From:To;
	b=xagwIUN6c4Iv4TXPePCzl2LlcL6aTZ1BjWqy/KqQ6O7Fum07Qtm2UzOFlbJSrovqb
	 aNIDTHbefTigUL6auXudkKgSKREkX+2y8yU20sp36g5/XCwg/MyzRPr6cjy/WT2HJx
	 S3JS8s2e6SK93MnVUBSaZwZakMLOP7+wHAroqTZRVcQC+a1Hxm5orfBbjFb/0WeLyP
	 7cX0n+YX29F/Og/hi/wIDXKuJjHLq2sw12yRlEj5yueDRUD43D4H90s8qkcdK44Kra
	 krXkqlYhn9ov5OSQUKFpiMC3NBIDfKZnDtfdSJyV00cBhmq8dGh1WVPdYFEAnAXaat
	 7VsVydY147vgw==

On 02.07.24 18:39, David Woodhouse wrote:
> On Tue, 2024-07-02 at 17:03 +0200, Peter Hilber wrote:
>>> On 01.07.24 10:57, David Woodhouse wrote:
>>>>> If my proposed memory structure is subsumed into the virtio-rtc
>>>>> proposal we'd literally use the same names, but for the time being I'll
>>>>> update mine to:
>>>
>>> Do you intend vmclock and virtio-rtc to be ABI compatible?
> 
> I intend you to incorporate a shared memory structure like the vmclock
> one into the virtio-rtc standard :)
> 
> Because precision clocks in a VM are fundamentally nonsensical without
> a way for the guest to know when live migration has screwed them up.
> 
> So yes, so facilitate that, I'm trying to align things so that the
> numeric values of fields like the time_type and smearing hint are
> *precisely* the same as the VIRTIO_RTC_xxx values.
> 
> Time pressure *may* mean I have to ship an ACPI-based device with a
> preliminary version of the structure before I've finished persuading
> you, and before we've completely finalized the structure. I am hoping
> to avoid that.
> 
> (In fact, my time pressure only applies to a version of the structure
> which carries the disruption_marker field; the actual clock calibration
> information doesn't have to be present in the interim implementation.)
> 
> 
>>>  FYI, I see a
>>> potential problem in that Virtio does avoid the use of signed integers so
>>> far. I did not check carefully if there might be other problems, yet.
> 
> Hm, you use an unsigned integer to convey the tai_offset. I suppose at
> +37 and with a plan to stop doing leap seconds in the next decade,
> we're unlikely to get back below zero?
> 

I think so.

> The other signed integer I had was for the leap second direction, but I
> think I'm happy to drop that and just adopt your uint8_t leap field
> with VIRTIO_RTC_LEAP_{PRE_POS,PRE_NEG,etc.}.
> 
> 
> 
> 
> 
>>>>>
>>>>>         /*
>>>>>          * What time is exposed in the time_sec/time_frac_sec fields?
>>>>>          */
>>>>>         uint8_t time_type;
>>>>> #define VMCLOCK_TIME_UTC                0       /* Since 1970-01-01 00:00:00z */
>>>>> #define VMCLOCK_TIME_TAI                1       /* Since 1970-01-01 00:00:00z */
>>>>> #define VMCLOCK_TIME_MONOTONIC          2       /* Since undefined epoch */
>>>>> #define VMCLOCK_TIME_INVALID            3       /* virtio-rtc uses this for smeared UTC */
>>>>>
>>>>>
>>>>> I can then use your smearing subtype values as the 'hint' field in the
>>>>> shared memory structure. You currently have:
>>>>>
>>>>> +\begin{lstlisting}
>>>>> +#define VIRTIO_RTC_SUBTYPE_STRICT 0
>>>>> +#define VIRTIO_RTC_SUBTYPE_SMEAR 1
>>>>> +#define VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR 2
>>>>> +#define VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED 3
>>>>> +\end{lstlisting}
>>>>>
>>>
>>> I agree with the above part of your proposal.
>>>
>>>>> I can certainly ensure that 'noon linear' has the same value. I don't
>>>>> think you need both 'SMEAR' and 'LEAP_UNSPECIFIED' though:
>>>>>
>>>>>
>>>>> +\item VIRTIO_RTC_SUBTYPE_SMEAR deviates from the UTC standard by
>>>>> +       smearing time in the vicinity of the leap second, in a not
>>>>> +       precisely defined manner. This avoids clock steps due to UTC
>>>>> +       leap seconds.
>>>>>
>>>>> ...
>>>>>
>>>>> +\item VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED may deviate from the UTC
>>>>> +       standard w.r.t.\ leap second introduction in an unspecified
>>>>> way
>>>>> +       (leap seconds may, or may not, be smeared).
>>>>>
>>>>> To the client, both of those just mean "for a day or so around a leap
>>>>> second event, you can't trust this device to know what the time is".
>>>>> There isn't any point in separating "does lie to you" from "might lie
>>>>> to you", surely? The guest can't do anything useful with that
>>>>> distinction. Let's drop SMEAR and keep only LEAP_UNSPECIFIED?
>>>
>>> As for VIRTIO_RTC_SUBTYPE_SMEAR, I think this could be dropped indeed
>>> (resp., UTC_SLS may be added).
>>>
>>> But VIRTIO_RTC_CLOCK_SMEARED_UTC is an assurance that there will be no
>>> steps (in particular, steps backwards, which some clients might not like)
>>> due to leap seconds, while LEAP_UNSPECIFIED provides no such guarantee.
>>>
>>> So I think this might be better handled by adding, alongside
>>>
>>>>> #define VIRTIO_RTC_CLOCK_SMEARED_UTC 3
>>>
>>> #define VIRTIO_RTC_CLOCK_LEAP_UNSPECIFIED_UTC 4
>>>
>>> (or any better name, like VIRTIO_RTC_CLOCK_MAYBE_SMEARED_UTC).
>>>
>>>>>
>>>>> And if you *really* want to parameterise it, I think that's a bad idea
>>>>> and it encourages the proliferation of different time "standards", but
>>>>> I'd probably just suck it up and do whatever you do because that's not
>>>>> strictly within the remit of my live-migration part.
>>>
>>> I think the above proposal to have subtypes for
>>> VIRTIO_RTC_CLOCK_SMEARED_UTC should work.
> 
> To clarify then, the main types are
> 
>  VIRTIO_RTC_CLOCK_UTC == 0
>  VIRTIO_RTC_CLOCK_TAI == 1
>  VIRTIO_RTC_CLOCK_MONOTONIC == 2
>  VIRTIO_RTC_CLOCK_SMEARED_UTC == 3
> 
> And the subtypes are *only* for the case of
> VIRTIO_RTC_CLOCK_SMEARED_UTC. They include
> 
>  VIRTIO_RTC_SUBTYPE_STRICT
>  VIRTIO_RTC_SUBTYPE_UNDEFINED /* or whatever you want to call it */
>  VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR 
>  VIRTIO_RTC_SUBTYPE_UTC_SLS /* if it's worth doing this one */
> 
> Is that what we just agreed on?
> 
> 

This is a misunderstanding. My idea was that the main types are

>  VIRTIO_RTC_CLOCK_UTC == 0
>  VIRTIO_RTC_CLOCK_TAI == 1
>  VIRTIO_RTC_CLOCK_MONOTONIC == 2
>  VIRTIO_RTC_CLOCK_SMEARED_UTC == 3

VIRTIO_RTC_CLOCK_MAYBE_SMEARED_UTC == 4

The subtypes would be (1st for clocks other than
VIRTIO_RTC_CLOCK_SMEARED_UTC, 2nd to last for
VIRTIO_RTC_CLOCK_SMEARED_UTC):

#define VIRTIO_RTC_SUBTYPE_STRICT 0
#define VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR 1
#define VIRTIO_RTC_SUBTYPE_SMEAR_UTC_SLS 2

