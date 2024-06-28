Return-Path: <linux-rtc+bounces-1423-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F211E91BD82
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 13:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FBA328543F
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 11:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A37A15747E;
	Fri, 28 Jun 2024 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="WTDtjgrU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FEB156F54
	for <linux-rtc@vger.kernel.org>; Fri, 28 Jun 2024 11:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719574418; cv=fail; b=sAugMUzfyoYUnC7OW5n9qEYyKZNIBOTYrzteWkWdPRrvBwJfV74disESQPBx8MBewfNrsu/pipbj56iVR1qV8kVJ/HzUrnUM1lGiuGfuSzVC9TjTAqhbJR6Iw+ueYInvUvjiHQ9lbat8Xc3ZLRu/NVMvdMt2epTtoIlHI1go1Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719574418; c=relaxed/simple;
	bh=YYt4m31XWkcUC+30kdyB/f8owcHcKW78UsY+t201T6o=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JDqxPOBDCf0zquR5N60621i+P3PxR6zbtACbDMNsf4GJHVWUndteAnkg69ZrEir5FY5Ff9Rer0uX2TWhJ3ccD1UXpNrUNeWLZQz63o7VISccLVxtRhFnGlCDLYQ1NXIKg2T6fdv17UXVN9zfaDe4uqWqkRe+2LO38YMayEZNDWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=WTDtjgrU; arc=fail smtp.client-ip=18.185.115.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.48_.trendmicro.com (unknown [172.21.19.72])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 5E00910041A40
	for <linux-rtc@vger.kernel.org>; Fri, 28 Jun 2024 11:33:34 +0000 (UTC)
Received: from 40.93.78.48_.trendmicro.com (unknown [172.21.177.236])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 029AA100017C0;
	Fri, 28 Jun 2024 11:33:27 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1719574404.579000
X-TM-MAIL-UUID: 709cd911-7712-4b36-a733-ce2b033a9748
Received: from FR4P281CU032.outbound.protection.outlook.com (unknown [40.93.78.48])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 8D823100383C5;
	Fri, 28 Jun 2024 11:33:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUHXKP87WyIMD71lApDWRO7kEf05MkJoqg6Qyvm5hdJm3Zra/l/P6RuDe/VSWEORy7yFq1RVBlIOIHBxxRzs5fzaruePmEpvDjN27V3r9awvgOB858bP+WWGHKlZEdg9g/Vg2BxU2dtaGbh5D7OG69cZpaMnBBygavSlFthgQf17dXWRMz6hxn7dYaXVguMKXa2DPKfqBP0AaR0WG+cNK0Tj154Q1c+J5nn1ieb86zbN12y7KBSReid35qOZkm/njJRgb+tPlfX5yQ+he+cEbldd3cwTl2WpaZkAzeHrPwb2ePu9+yKqHSu8z12iUCbixpCS8MLY1OoXED3W91GNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZpDXbs/FyyIOnvn0Dt4G+G/qHBRrTc67aRQgCpZBrs=;
 b=af3J9Q+AEmU7HOH7mSanm0VdCsqur5unrWOp8VgnI6CR6VJ8PSiErJPvatRnUgU9g+l53DCPWPbzeYu9YZl7gkjDh9RXO1G2FaTAXM0KJZ7N4Cw54GLNO3NTSaus/QgXcuqapJWTBlDE5jUljA+OWUTKietrehUOaO3vKsW2DVgnBJyvWKWTXMl4fMt+/7A67d+9ofIN3r6oRLHx9rh184yDnWHqmB+T+3LuNPbEi9jpZsvJNc96kZVLnIzcW4K8ssPfSv/gmyWm6HiEYskQ6tO3NKrBqP6MSIXT6wb2bvAzTBXzOWWEAcTn1IHJl0NfMMX/8pd/3TZo+0kbGpDbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <03d4652d-5bc5-439e-ba32-b17170709584@opensynergy.com>
Date: Fri, 28 Jun 2024 13:33:22 +0200
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
 <51dcda5b675fb68c54b74fd19c408a3a086fc412.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <51dcda5b675fb68c54b74fd19c408a3a086fc412.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::7) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BEYP281MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: 146ea1dc-a971-4c8a-8577-08dc97661e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUtlSlZpSEZjZm05ejdleW81ZnJUWWREaERxSHJOenFrYXYwSFB6SXZucXNZ?=
 =?utf-8?B?Nk1DaGIzcWIwd0pTaXRHb1BQUEl6Sms0SFlRUk1nVjBHdFFJTTdRdEJuN3lp?=
 =?utf-8?B?Q2RzS2wyakR0UXU4YXVzVkhQUWo3M3dzSXZwRGU1OGU4YUFCbDNOd2pBV0ZV?=
 =?utf-8?B?dXV5OEREMklDVWppa204ZURuTngwYkF3OS9oZHlaeVUrSnpCemk4QWpwYVFp?=
 =?utf-8?B?MXlPRmNaVW5IT0hqZGtoNHlyQnBwanlIeHRFYnU3RHMzcXFOYW40OUU4NW14?=
 =?utf-8?B?Y2RtUXEreGZpbEFNWTZrcjVyQzFIbkZxc3JVRlhmTExjZ24rcTlFL0xtMkRk?=
 =?utf-8?B?OWJZSEVrNXk3bWtXRXROSjBpZzBGditrMnFEaTJYWG9uYkpEaXNZSXpEZHJP?=
 =?utf-8?B?eFA2eG9tK3hnazlwUzBOQVFGVXcvQmNQYlRvcG13UTlyM25ZM08ybmI3ZW9J?=
 =?utf-8?B?bU9TNWV3K0xuVmJRdmp6SXV0QkcrQzhlOTAzdENaY0wrWjk5SUZQaSt2N01O?=
 =?utf-8?B?RGQ2RVBPWFNzamNkNHFKaE0xTzd4WFJoUFM2VHNsajdIdU42RVZJdXVqSCtO?=
 =?utf-8?B?azZBLzlHNnBWRWt5RURuL3ZEcmxvQjVGL3hTaTFiUXRJQmJGZis1N1d5cm5z?=
 =?utf-8?B?SmdWdEFEZFluanFmSU9nL2kvbUNSRHpFeGZlVEZNNmRzaXpwcHRWQzkvaVE2?=
 =?utf-8?B?VWw3ZE9Yc1J3bXNrLzh6VU9yQlJVNDR2WWR1NlFUMnZWNzJTMGdON2FRZWV2?=
 =?utf-8?B?N0V5eC9JNU1YS0UrZ3RnVTlITW9XZXJWWjRyZTkvYURWcmhINGZaQ29BQUVS?=
 =?utf-8?B?aFQzWFE5Zk1EMTJ1K0tiS1g0OEhHeGZPZ1hKSElaK3JPTUlvMmhGSmhIV0dY?=
 =?utf-8?B?eXhOQTZKQzQyOEJVU0FOd3h2b3lsVnpWK0lyVWdObzVxSEZWdVUzbEFXRENC?=
 =?utf-8?B?bFllZC9jMFBjSkNwRTlGVFJqVHphelorTjBpSjdkT1BoUExNRnFqN2JNSUFC?=
 =?utf-8?B?ZHpzaEFOalFiSmNCNm55cmxINlM1czhNWlFzQTl3K21KYXl0VXBCcTR1NzZu?=
 =?utf-8?B?MEFpQTVuNXFiaFRsdFRSVFJEYVk0eW9xZ3RMSUFMa2pvVVRySmxoaXZxSXRU?=
 =?utf-8?B?TEdTWVJjVWo4QnZGM1hqSnA4YkFVYnhJUW1qNHd5d0FvcndHQXEvNmdncGto?=
 =?utf-8?B?RWI0NHlQRVRMaHAxSEk4eHBDZUhWeXRoNzYyT0kyQWJ6Nmt1cTlZVWpadHZa?=
 =?utf-8?B?RzBNZDFvVVZnM2ZpaDBtYnFNYWxRUmlTNEVtbDJ1TXhmWjFjcWJPcWZRMUFG?=
 =?utf-8?B?TW9iN0crN1hGRi9QSUwvWm9BRDQ4VWpQRzNyeGd4cFluQmtJYmRHalErOExJ?=
 =?utf-8?B?aGg3ZURUM1M3MWFnbnlZWm9mMWtQRDlWdFE4bVJLY2dadUFWaHRpWTAwcnVO?=
 =?utf-8?B?NnhpR2wvTkNjTmtsM1RVc0xKcFdnOFl1SmdGYVAzVnBLTDlVdncrbW1vaExh?=
 =?utf-8?B?Nlh0QjU2dDJHK2RHUzZhUkpENDVQSlE1NkloNk9aY0Z1OGc3cHJMYzFjUDli?=
 =?utf-8?B?UHRLRy8vMXBnZkdSZGEwM1djVzdkNFBrdHlJT0JFTkNERmdnQ2hiR2YxNWVo?=
 =?utf-8?B?cDBHeWl3aHhIYVJkS0hZak84Smp6STN1ek5icUhNS3JJSDNiazZwNjZGa0VF?=
 =?utf-8?B?OW1CNjBCcFErdFJHS09NQ29uT0JCWkxVUVRIdmdDZWNMaURzeUhLNmRmM0NQ?=
 =?utf-8?B?eUtLVThoMXRvbVNKc1N5OHVHelkwd0dBTU9ERmcxMGNiQ3I1d0J5K3czblA2?=
 =?utf-8?B?c3dhSU02WFEvYkxOQTBmS1R6dGdxUHNlMysvN3QxWlRZWStuaFNDclM2bXhT?=
 =?utf-8?B?M0hFMldwMzJFZzlHZHIrdEltcTl4Ukloc1VOalY2MGdJK2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bi9zY2xHRzVsMVN4YkR4RlRUZWhyb25Gc3F3Zk1SUGJWSDJFYXgwUG5lbXZF?=
 =?utf-8?B?U2dPN2k3c3N3dDFsVVRSNEh4WWJDc0ZYZi9NazVlb3ZUSFZBK3cxallrQi9M?=
 =?utf-8?B?eXVvUjBPSVdabC95c2RIYzA4Zk52THk5L0RzVC90M3RzR3JpUG80clNjdTJ3?=
 =?utf-8?B?SVk1WkhxaXc3N1JrR3RjeXF2SXlCWDE2b3M4aTFvQ0hWaU1QdWNFZUlqdWVp?=
 =?utf-8?B?TkJJZHBaeUVhQTgzRHNuSlZMS1dWSm9FRXBSVlZYZk45eDZQYWc1eXZBR3VW?=
 =?utf-8?B?a2hwNVZ6Slh6ZXlVd2lWc2JpazI2MUhINWZkM3I0a0VoUnpoZ1lydCtNS2dw?=
 =?utf-8?B?UlZFLy9WWGtuUGdCQUsyb1FZTDJOVDlqR3liak11czY2cGJXNFBzazlKSTB2?=
 =?utf-8?B?SkpwSTJWV2NrZ0dWN3VNejJxRCsrWmZZbkN3a0tDQkxhTVNCL3FwY0tWVStP?=
 =?utf-8?B?SXlRajlEU2VmWHRzTy80WVJGSjJaYkorMFhVa3IrSEtTeTRYNUdTSDRFdmU1?=
 =?utf-8?B?YWRHYXAvQVhPTmlmMDlHVSswS09nWERuN0ZPS3ZpcnFXb2hhcU5TVWZ1ZnJQ?=
 =?utf-8?B?N2Z2K1FzL2lXckpyMURUSG5tenc2aktlK2poWGhIdjJOanVGK1dEY09xNnI0?=
 =?utf-8?B?QXNvR2NKanpVaHd0KytwdDArVi9HZzNNZmtmTmRJejBKZThrRUR4TWJ5MEJG?=
 =?utf-8?B?SFdIYk5taVNXbE02VXpLMXVUMThKb1ZqM011bGR3ZkpTdzhYc3l3RG85ZFJO?=
 =?utf-8?B?OVhZZFd3OUxIUG0ySURCeGdLekhNdk1raDlOU2JZRmhwRHk0S3dGMnZ5LzRo?=
 =?utf-8?B?NDhMOTBGVjM5Q0h1Wkt4S3MvNytZTnE1dmtqWDVZMjRFYVR0NDZYbW1abWth?=
 =?utf-8?B?S1NZUEtVOG5qb3RDN0dzV0lneDc2VU5FRWh3OFlBblY0ZVR3N01TWDhJallu?=
 =?utf-8?B?MXBlUjdlWlc0ZjROeWhhb2VRbVpld1E1R3pJTzFHS2daREhpZzZrUms2WHN4?=
 =?utf-8?B?WkE3ZDdKYnQrRW1kQUVSbDRJK0phU0VDNlB2NUR4c3VaSTFGM1JXRVoxSjdV?=
 =?utf-8?B?K2hDNitNNnBLbWZMMmFqLzUvcDVkd2FwTEZiTTVqZEdJMUpPOVNHYmZObVRv?=
 =?utf-8?B?aTFTNzc2LzBHZWJGelVzTTlhUXFHMHI2MUVEczBCSUl5bjRzYU9PSXBRVkcx?=
 =?utf-8?B?Z0dQak9sQnN3aGJrbGhKY3VLanBlVmtqSEtTVFpJR0gxY1VOOEdBMWllc3Bn?=
 =?utf-8?B?a2lGZTAwWDlEUHV6eXBteFhJdkptYjF0S0tNcktUMnRpbnQ0Q0VneGp5S0lo?=
 =?utf-8?B?WXFoQXBCQ0tuT0JXOURGbHlWaTVlN1hGMmtvZXZwaks2TmxOVzcyRmhRTzBu?=
 =?utf-8?B?S1p1SkR0MVpaNHVFbVI5R20xelBKY3VmN3gyS0tnbUY3Qm1CRCs1UnMvTnFD?=
 =?utf-8?B?K3h0eFUzSXNoci9oZXNFWDF2anlZV3R1WHQ0cm9qRVhOQXRJWVg0a1RxNlhn?=
 =?utf-8?B?WmJLZXY5TTBXa1NpNXNmSFpkN3pNSXBydTl2UkNlRENDOSsyYkkyYlZYOFJw?=
 =?utf-8?B?R2tZSWMrR3lENTd1cFQ5RmJPSDRWbnpVdGwva2FZMUJFS2Fvc09nY0lIcWRu?=
 =?utf-8?B?STZnc0ZJUUt1YmlHUzBJNHhZUjVrUGNaYzVyS1FXMXgycDM1bVdYeGpQT2Mw?=
 =?utf-8?B?Y0NqcDFJRkhmTlF0MXpVUTZDdkIzQWhvQkxqU2x3UUx6Z3AwMHVjak5zRVBi?=
 =?utf-8?B?c094MExGaER6b1dqUno2Y0hiQWJESUlnaDliNDZnRFJKKzhjQUNwS3hvNE9j?=
 =?utf-8?B?WW5vczRoU29ScFI4dUNWeW1mdm5rcHYzVmxhUmNZV011aGFVbzgyd2ZxbWZ0?=
 =?utf-8?B?a2NyV0RnbjEvZHREZ2U3QitVQmVyZjYxQ3FXdDdGWCt4RUJiZlIwK2ZMdVUz?=
 =?utf-8?B?NWxPMzRNRWRTMlk4MUxJK0ZMS1hiekZ6Ykk3L3RsSHczZG54WWZXaU1DTTYr?=
 =?utf-8?B?M0hRdlBDdWc0N2dlSER0WkFEV2ZMb0NDNE1FcEtqSENoSjNZRUdvRVU5VERI?=
 =?utf-8?B?S2pkWi9qLzBvQjMrY3ltcWJVVVlLTGZNZkxRL3F6bk0wMVFkVkJ6aVdaVXd4?=
 =?utf-8?B?K1NBSGtYOVhPcHY5MGhLaDdBd0pvdWoxU2lIZk1XY3o2UzZwZFp3QWF4SEZZ?=
 =?utf-8?Q?L72mLtrcfijgDfu3EIO+3IcnxD2lPMGo/Ah9S4U0nUH+?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146ea1dc-a971-4c8a-8577-08dc97661e8e
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 11:33:23.5794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hO5DZuyUhFOmtSa/cZ2+TT4Fb6B3hs9p5bV2d2MFkYLoose6+QHEBuXi7TbyEzbEK15jTPsKfzoIDGXZw1AnTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEYP281MB4460
X-TM-AS-ERS: 40.93.78.48-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28488.001
X-TMASE-Result: 10--8.184800-4.000000
X-TMASE-MatchedRID: u7Yf2n7Ca/35ETspAEX/ngw4DIWv1jSVbU+XbFYs1xIah94vm62fVcSt
	uXj96+1kORoZNSkXTnrvLdi5EyjUaUeHSrYPABcuS74sGh2G9bEITLgGy+AiMyUM2uA06Hzo2oo
	p6Ld8r8HRfJvw1mkjJreHn1HAS0YSQYjhk+onlpDIUNmTDb0ad7xQl4G5WUCKlvf2z9vv1cGz9s
	TyTSvtqTtHgiwyZCoOT783HNym3W4mLH6f1sBOKzmoMBkrmuf/mCYM4MaoFU97wQPQv9XohSI+K
	GBvwjpRRatw4vj6F2aNfczRoWaFQ7DP95vZKN8oWWSz4drjSLhimmowi1sSA4j+QP7WhY0Zv9rS
	d36EgUIj80Za3RRg8MRGCbYKb/ZEQGHCX5zbtWV7GF5q4ab06VjfIhrd6Mg+hhLpsXPmiAM=
X-TMASE-XGENCLOUD: caccb0ab-cada-4556-a72e-fa095f3aa85b-0-0-200-0
X-TM-Deliver-Signature: E85EE5C84DB0DA7F23B600F441FAF1B0
X-TM-Addin-Auth: Rnwq3ym5Yf1I+SBQvhlSMPAqY9t+TFY3PS6d7OgXwbCs31OcsuSMLKqx6AB
	OYUZaeSSw9CminnQ4ydQ3AaXAf1c4rqqa1NjmWUtCGdIyf3aj4WhuiRGgcSSZqYTGI3ughCm++e
	hYl+/S1OCYtkmEPM9OtqcD5ob1FW/uyTOGu2hOYMto9JZEnviMbKSMpkmKq9E/ZakrT/QXxuX2b
	3ml3tvq7X2sonwykLZjLLzAH9FYDQ0h7D4zUW6Kxvfh1q2G4t/thxOZPKk+hEEToTpIZE0y02p4
	hmcGq9rJgobVfyc=.SG6tUQp6CDUQCiEarvY0OTotkYdqHLUUuD5Ixi+ED5GKRCVuhCAXcQ0E3n
	+JfyXECgXlVIuxyDul8D+vUEe9RdTxt+JXNbahj6aN+leD38pjQDeWNKt+NJUkMae1CKPNBSs37
	CzD+jlWneNzSDq1IhZ7oVksnwMjaoADOaVxOhOJ+uMr0ihrKm8EUta3joFRc1r2jN4bLdtDlfiN
	WcBJH+okEtthLJWGZN51QAoRcnOWcxQgKRdgtSI5xTo9flVNY0xPZcSX7kkz3RpJsHdmxxjYukM
	etOPoflZmOGPoya3ZyGdqswSSDt+lOakFDq+Aiap4+0Qa220HpielHnV9cg==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1719574406;
	bh=YYt4m31XWkcUC+30kdyB/f8owcHcKW78UsY+t201T6o=; l=1783;
	h=Date:From:To;
	b=WTDtjgrUgajE0iDMFbvqKDvzDeKv117KpjiOoU3kL+EA+jieJwJbPvRZBfToElRRr
	 d+1h2+K5dKqBtrH/OhaXzLCR8j1qI+5Bw8ILmlBDAtDQoKxloRCf7rVVlPtEdXvjph
	 77iXQw9Xyv1RL64hfZWoj/zOl2WP614qPzcyGus8rucMcYoVUm9K06TvJ6JSpwh8sd
	 EmGL5joX+zSoc2mWSVJdTcz4N+wuHXF27UVrTln6WRzr84AXFUkIh/hKI0vLbEmBhk
	 3huD6FWrBVt5au3dV+ChcMqqgn7fMtBWshIWSdZK5XFsJZpAaB6u9cs9HyPuTb5+5i
	 7+Ej/pyIaofyA==

On 27.06.24 18:03, David Woodhouse wrote:
> 
> I've updated the tree at
> https://git.infradead.org/users/dwmw2/linux.git/shortlog/refs/heads/vmclock
> (but not yet the qemu one).
> 
> I think I've taken into account all your comments apart from the one
> about non-64-bit counters wrapping. I reduced the seq_count to 32 bit
> to make room for a 32-bit flags field, added the time type
> (UTC/TAI/MONOTONIC) and a smearing hint, with some straw man
> definitions for smearing algorithms for which I could actually find
> definitions.
> 
> The structure now looks like this:
> 
> 
> struct vmclock_abi {

[...]

> 
> 	/*
> 	 * What time is exposed in the time_sec/time_frac_sec fields?
> 	 */
> 	uint8_t time_type;
> #define VMCLOCK_TIME_UNKNOWN		0	/* Invalid / no time exposed */
> #define VMCLOCK_TIME_UTC		1	/* Since 1970-01-01 00:00:00z */
> #define VMCLOCK_TIME_TAI		2	/* Since 1970-01-01 00:00:00z */
> #define VMCLOCK_TIME_MONOTONIC		3	/* Since undefined epoch */
> 
> 	/* Bit shift for counter_period_frac_sec and its error rate */
> 	uint8_t counter_period_shift;
> 
> 	/*
> 	 * Unlike in NTP, this can indicate a leap second in the past. This
> 	 * is needed to allow guests to derive an imprecise clock with
> 	 * smeared leap seconds for themselves, as some modes of smearing
> 	 * need the adjustments to continue even after the moment at which
> 	 * the leap second should have occurred.
> 	 */
> 	int8_t leapsecond_direction;
> 	uint64_t leapsecond_tai_sec; /* Since 1970-01-01 00:00:00z */
> 
> 	/*
> 	 * Paired values of counter and UTC at a given point in time.
> 	 */
> 	uint64_t counter_value;
> 	uint64_t time_sec; /* Since 1970-01-01 00:00:00z */

Nitpick: The comment is not valid any more for TIME_MONOTONIC.

