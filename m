Return-Path: <linux-rtc+bounces-1406-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC5E91A853
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2024 15:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F22441C20BE6
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2024 13:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68968194C79;
	Thu, 27 Jun 2024 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="GzeV9QOf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F12194C72
	for <linux-rtc@vger.kernel.org>; Thu, 27 Jun 2024 13:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719496292; cv=fail; b=WRIUSrq/1qZrYlI5cZ8ajwhowRdtKIzg6m7rT8eaKsgv+lIGdxwL+Br/M+o0wcLRX3PPXbo6luma/6LabzkpDGZEXfCsT79Ss8pVtXF+xmmXdCunehZiPYW4A6gQGIZVYEx6Rf2Hzs+wiBRae34GI6oFUMfXExB27oKEAS66Tsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719496292; c=relaxed/simple;
	bh=plKg3WxPhprSEUx6bkKda7r9Fqg8KUDcVW7iVsTqEWc=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gzA+9IvZRN9e6u36rCwFtD5su+rpH+iYFmKLsBgTgj1kDtyb6rxP8pO+9LjjRhnl+HlZU0KoXu3+exWyCYicV4iynftGDy1rRabsLWjQFNK7OyvY6gHsFTRKvAqderZOvonpAa30vvWNS2sDogCVH+tJQ3fNhKQTUfOL1yeM0jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=GzeV9QOf; arc=fail smtp.client-ip=18.185.115.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.49_.trendmicro.com (unknown [172.21.19.113])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 6F3C71016F957;
	Thu, 27 Jun 2024 13:50:38 +0000 (UTC)
Received: from 40.93.78.49_.trendmicro.com (unknown [172.21.177.236])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id EB179100026A1;
	Thu, 27 Jun 2024 13:50:30 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1719496230.095000
X-TM-MAIL-UUID: 81b26859-eb63-4def-85e1-4d61acd8203f
Received: from FR5P281CU006.outbound.protection.outlook.com (unknown [40.93.78.49])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 176EA10004C04;
	Thu, 27 Jun 2024 13:50:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3EYjvF3Xez8zvMuwj9SOjLPp/NINW8LO7aOEBC4PGea6r6hxuQshsC46+W//KQFTiEBpeaJc2s/gO8nVyiikmmDbVUTpq4ntbpJhdP6euIT7ajLn4L/RcSrZuv2trUcvJRAygiBdCeI92jf6ut4I1694D7FBRKWVY1aGc0KGdpfbFbyDIzgvvOaO8n1iB6Tf1qe/iPkJzr+VFjiZl9LiHNfLW/9Yx1bHeM8gs5uP6KY0ZbhUJOX7MpVCSPTKsp5XR/qS4CY629KSlocSbBMjCqsiXojAgVuAdWwUCLsQFk+8cWczIzHJjH2KneqdBWl8AK0XenFYiPJcu/n5rIFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2EIxcAl45+FaVYHyzZJ2tOqM+oTqAu6Afl6nw57Q/0=;
 b=DMhih47IsXqk0H/XMAv3PtzGwz+obk2S5s/fze8//s2KC8DWgHe+LI/znhIh+VzmskclJUD3w/b+os5FAlamrrLHi0QNjLvc/dE0aFivk1KbXNlyt5YffxmampMCkQwumcAU1ZfZjR9qsBeubZQNEJgENGtY3qRKjA4zb2bKtDvmMnWJP3B9QPgP20DEB28PVZvibUM4gK6kudDQ50rX4xsgZG0nTRUPiw9eyuC5BshWTAZsl1H1jfuC2kTFKpRYRDfkhnCyHQTtLxzvf1ylNkXVCl5boQ71ZN2dqcfxdVWkrvyFHh3ftOkDlzEtvGDCstPa1q5fyNQJAvrpmsRQHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <8d9d7ce2-4dd1-4f54-a468-79ef5970a708@opensynergy.com>
Date: Thu, 27 Jun 2024 15:50:27 +0200
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
Content-Language: en-US
In-Reply-To: <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::20) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|FR3P281MB2572:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9f15ca-04d0-47df-9c0f-08dc96b01abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmIzY1lZaXdwMVpXSGQrNGpydFE5QU9hLzZHVzEvS1pRQXd4U1hhRjhUR1Y0?=
 =?utf-8?B?NmxWamRGQytuSEUwclN4dU1IaVcyVXVHV2U5My8wU1Q1cG5lQU16RDl6Z2Qv?=
 =?utf-8?B?aTMwWDdDWjNDbUV3cjVkSnNSSjVFYkQvOEtHd2V2QVFvamtEMnZ2bnNZNGpj?=
 =?utf-8?B?TjVBZnpmMmFPdGNkbU5LZFRqRFFoS1A4ajdPTktSU0hxNkdRWXhDSk9qOGdU?=
 =?utf-8?B?d0JHOUZuQUpwakdUQkVYTlRZOWtwZkpUYTN4N1J4RUV0RXFRVU1xQnppcFZv?=
 =?utf-8?B?UnNHZWc2ZkVReStGbWNyWk0rdTJpSjVMNnBBWmpIMzBaRTRCcVprZmF2TDJq?=
 =?utf-8?B?Zk9tTkJPeEVndXhFcVRSYkFhQ0ZWd093NjBQRWx0K2YzREI2ZmlpZ1g5WFEx?=
 =?utf-8?B?cjZaT0lYbHEwV0k5M2lBR0VidDRQS0tRRzU3QWxDbTZqTlN1eE5iOGtGcEVl?=
 =?utf-8?B?a21VTFdaN0FIVVl4ZnJsZmw1d3RuNGg4OWtWOURjQ3poUkhRVHMyS3B2Zk8w?=
 =?utf-8?B?Z1RKeTZvTjFsdGFsMjdqZzlJQ1hXS1o3Z0VQdGlOU2R5WVo5aUpDYkI1cVRl?=
 =?utf-8?B?eHFSVHM3S0FzcHFJTjZTOEQzejFPSFV2cGZHOTJZQXl6cEE0MlUxOWNPN1Zw?=
 =?utf-8?B?NVdtcTZtS1NIakxvU3psbHNtcVdicmVmQlppamdNbDY2MEFSaG00U2k1bFBT?=
 =?utf-8?B?Z0RKRXFVclRsekc4Q1BsbHgwVDBGbU03L1hLbm1FNldOeXpiM3RrQ24rZXdy?=
 =?utf-8?B?aUhidWdueHdJQzA5YkZJbXVuU3UvVTZUdXorNlY3RFpBcytLV3EwckZLdjFR?=
 =?utf-8?B?clB0dEMyUWV5cUY3TUFEWW5EdU9yWXB1NTg5SGpybzlzOUFPQ3NENHRoYnhX?=
 =?utf-8?B?TE4zV0tZVzB0Q0wyV2M4Wm9kRDlHNTBFb3VWcmRlQlNDS3M1Mzc1Wk5BTzlK?=
 =?utf-8?B?RVFmMU9ONlgvTmZURW02b1lRZm1CQ0ZSM2pxK2c3QkhLMmpqZFlKcXFUc296?=
 =?utf-8?B?SUhYL1JBYXBqYmhDVjd0bkg4WXFWd0dXTHRYQ1BTMWlRWThzWENTRlpaTDhR?=
 =?utf-8?B?WFVxUFhkL1h6VU80RmU1b1NsT0hONkU0NytnMVlzRFhmSXV2bmZzQ0FNV1Jk?=
 =?utf-8?B?K1l5L3pscC9reUJuUUxLWjgxSHdVR1ZNaE9yaGRoN01aSjJOcEpLYU1zVnds?=
 =?utf-8?B?T1dHcnZ6SGl2MmVwZW1Obk9NdjdhaFpWNGtRSCt3Yzg4b3dHQ3I0MHFMRWlB?=
 =?utf-8?B?SStJaHY5TWU4eXBJOUV5YkZjUjNRRXZuZk1nTkdWc2RRbmY1aDJybE1ZNGlC?=
 =?utf-8?B?VVd5VmFwQ1ZycDd5eFhFTUNSL1dZMkVlSzlkMm4vRnU2V3NwV1l3cjNkZWpo?=
 =?utf-8?B?MTRHckllcUttREdpckRSRGNFQm5kVVMxTnQxRUk2S2xFWm1aK3JMR05oYTBj?=
 =?utf-8?B?TFh4cGVwYnlPQ08xdlJuaHhmcVRxdTBFSisrL1JGL1pKNUcxbGppU1RJalYy?=
 =?utf-8?B?TzE0TkpDa0Z0WmthdWlzMCs3TlBscTJLWjFoZmxGOUhiZ3Z2Yld6N1hxaVN2?=
 =?utf-8?B?Z0VVM3NKK0tzTzBFK2hKSUhyTDZMOVk2UXhuS0NuMHJodkNma1JzTFJvNDl5?=
 =?utf-8?B?bElZVENrdjVJS2d5ZDlzb0I1VmtaN1pHWVlYOXpqSjFvQkRJbGR6bnJUaHNp?=
 =?utf-8?B?M2xheWpLWmZoY0N1VVNtOHZQYm56bGdHUThnVWliYy9KRXQ5UnE1T0tBUnZL?=
 =?utf-8?B?ZnJPSmM3dzZDVkFoYmYxVGx3S01nM3BZUUZzbjlKTEdKdnNmWm96RE90Q3p0?=
 =?utf-8?B?bGpXNVgxZWwzdWNHNFp1M2VsdURRMnBoWHdESnAzNEU3WXg1VWwzd2JIWDlJ?=
 =?utf-8?Q?yQqxw4DSvZp8d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXZVSW95Y0VaTEhiSmVzRzFYZTdHVnZKT1pFaEVKc1lweU03LzY3bHJLOWQ5?=
 =?utf-8?B?QVpjcUkyY0JNNzJwQ003L1YrcWhPeHJLTklOb0JEWjU4OUpocDI5dERyQ2dr?=
 =?utf-8?B?M0RtdW1QT0ZpQjYzN0JuNXNWMDlyRGlPazZ1ZXpOL3labWZrdkxwRnJkWFJn?=
 =?utf-8?B?RzZZUWV1L0o5OVZldE43UlBmdm9idjlYczFvdTRIeXY5RDVieTRzWXFGWW5o?=
 =?utf-8?B?b2paVlRDOWp5aktndzJxY20zYmgyVjcyalRubnNwYlJKM0FiMlA3UVVkUXZj?=
 =?utf-8?B?QjFhK2FmTmRVdDlwYklGZkR1dTBZVldFZWx3WmFQbjJLM2l4ek1FbUtRSGg3?=
 =?utf-8?B?OUtSa2kzV3prL1JaejJ1NXRDT241enl5R0JMbWtaZGZYRXNETWJ3Q2VkSVNT?=
 =?utf-8?B?VyswMjY3MUtUNXh0TEpQUUhyZU9WanFUaVo0MCs1ejl5OFpObW9neW16RW8r?=
 =?utf-8?B?WXh2Wi9OVWtSZU1tRWgvK2wzL2FpcjZ1cGJFdVJYaEh5eGFXNi8xOTJvdFhi?=
 =?utf-8?B?TTF6RjUrWms3NFE0L3FvcXBTTGR5UWhtMy9WZG85N0dpcXJBZndHN1ZTRmlU?=
 =?utf-8?B?blhaK0VFTzdZY0FiMEx4Tkt2QjhPaWpBK2tBbDFVZU9LSTZaU2VSTno1WmJq?=
 =?utf-8?B?VldaSjc0aWNoZiswUjZKcUJaZk9jZkR1Vk4rdUplR0orakRxNWdwOWhITm51?=
 =?utf-8?B?ZGpGOFNmL2Z4SnpNVDE1RlBvbVBrZ1ltMkl5K3hBRDFkbk1GM1JaQTFPc0U3?=
 =?utf-8?B?M1ZiZnpsejdnOC96dUk2K0FYYm5VcGNoR1VnZmhoMm9pdnFDcHhkUm5GMk9p?=
 =?utf-8?B?U2FPN29UWDZONndZbUplTlR6aURpUC9hV0JZYnc2YlFvWmYxVXltb3pIQlJl?=
 =?utf-8?B?dXpKVUFHb1lzbGhNcWtCcVA5ckcrOCsvYlhwWDZSTmhUMVZDd3R3UlBmSHVo?=
 =?utf-8?B?UVUrRW90TDd1aWEwMURnTjFSanFLc3cyQmszQTArVUxYNlYvMEhKTEJ2am9N?=
 =?utf-8?B?OGY2R0JmY2JNVmZBUFZuU1ZqWFBtL3JGRmhtNVVBSDNxa1RUbjlkOGE5WVNT?=
 =?utf-8?B?Rk5NTmNCcC95Z3E2RlpMT05tSXBtS3VEMjZVbWZPVHlrZEFuZGlpS2xGaWtr?=
 =?utf-8?B?NmZKRFJ2TDlCckRyb1hRNVlkWU4zZURoWXZOeDZtanZ1TGdaRkNzblVQRGxB?=
 =?utf-8?B?NGV5TDVMY0NORm45cDlIZDM0UGJKSDJvTmEvQVU3OFdMSllHQnd6aTJVMXlh?=
 =?utf-8?B?RjBUbUhpNzVBWkRUTTZUbDNhN0JGNkNaVWRSUDUzMFJUVktBQklFNmRSZVV3?=
 =?utf-8?B?VndPaDQ3WHZzYlorTlRqS3NUMGpsWjU3OFFiVExzVFFqWXgvUmNqV0ovdS9X?=
 =?utf-8?B?WWV4c2k2SGxVeHV0UG5tSnMrZEtkUjl4c2xKZExmOTEwNmtwcmdiYmplNEVY?=
 =?utf-8?B?bFJGSlBvTXFjMDFuSlVjS0xoQ3QxeTIyVjFFV1loMzR6NTRQQ1FvNzV6OG52?=
 =?utf-8?B?a2JkbGxuL20yKzhuUE45dW9hT0MvR2dBL2MrOFg5emMxYkRkRkNpUjFyTFk0?=
 =?utf-8?B?ZHVTMnQzTjRMUVFhQkl0bTB4clZaVmIyblRZMVJSNWtZTG1WNXNUK0poYXhL?=
 =?utf-8?B?RnM5SUYzYVBpa0lHN2xiaS9WcU55dDdRYUNsWlZXZDJRZlhtbjdNNlFleUQr?=
 =?utf-8?B?MnlLNGF3cytVOGFmSGc1OWdUenVtcktvVS9SUFN1Rk02dzZ1VzJGVGxsTEdm?=
 =?utf-8?B?aFh6cktCOWViQjBhMzlHTkZySjdrMVZFTE5zVDFkVVo4VGRSdmJjSE51M1B3?=
 =?utf-8?B?NkQ5bm40eVhrTGp2Y3VLLzVoMm16V3RUQkJZU3hTZnNZcHNrRzVuZE8xVTFn?=
 =?utf-8?B?QVFpdXd5d1ZkQ2J0TEVBeHlOa3FyUnoxT0xieGtSNVRGanhzTVBOUGJBOUxK?=
 =?utf-8?B?QlNyNmJCdE9tVzh3aXUwZFVPVFBubmRYczlCd21lSFZrOVAwVi9SNFM2YmhT?=
 =?utf-8?B?eUpXMGZrOWQ0b01IRHgvNVdpLytXVW1HbHRMTWVVNFVTbEZKT3R2ckVGYU5Z?=
 =?utf-8?B?bHlKeWcvdU1FWE84dExFd3psZFlGYjhEcE5nRCt3TXRzYmRVZ1FXcFQvNlJu?=
 =?utf-8?B?U1lJVzllR1Rsb2ZMa3VSZzl0MVhPUUhrSUd6Qm03TnE1THBVN0VJZE1Bc01I?=
 =?utf-8?Q?Rd34tdF9budb5/bifiAHJmB4KearP5Ix20YNp9bxjdHi?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9f15ca-04d0-47df-9c0f-08dc96b01abb
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 13:50:28.7670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgKVkxu8Vt5UmN6wSeSDh1MmtWKA0XKCKZPsuoRHfK90stSUza/mbpNFVrr3w2CzT57pMs5Yl5t8hwWqwqwfcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB2572
X-TM-AS-ERS: 40.93.78.49-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28484.007
X-TMASE-Result: 10--33.952000-4.000000
X-TMASE-MatchedRID: Rp71wniPtoP5ETspAEX/ngw4DIWv1jSVbU+XbFYs1xK3UJJ8+n/4RdDF
	H3Wq0Hei8/CUaSFEolDtIrpZrVLcYZ5mTKF4TLatoSymbNaqh68JMPex6G5f2r2L79/20sYbTAL
	CCJPLAA3SZRaS3C7tNYh+byAceuT1Z6/n0AY7xPSSHQtEOSQwHF5s7e2rur9kYcKx85MjSJWyZ9
	qKJ+FZPoUFklUxE+Q1UTBH8t2UaNU8IP7vQP1k7pugXjKc0GVo2fyKCmAaFFa0/5ugroRisfGH9
	6mIcqijLV9WPcpSHLKM31u5wpKeWqDC4fK71Sws11qnBW8yYK97tzq0SRd7O3miaGC762CcXRxS
	X/kDGOtEWPgSIEo5Cd9iOH5TDj6mrddi2w4fb9BJF1UGj9ejec7P4JpFsMVwWB/DYwvfuLVLqVR
	s6RktutXaEN+2Dt2PV2ZL3Le+KN+bt/4hWtpdQmAUuATtPHJDSZ733hukSSzDfq8GMQRIAP/rvp
	rwxbcdnfNewmybbL1LP8voR8Wz+EwBo2eYZQcCZhL02vM2qdpelLFkoMPMWE69uA5BeruAlw8UO
	ngKoKRXeSjuqkjX4LRchDoUW0Yq8GjCF7GkJjBCPQBD3xA/3aryV/2jRq/XEgg3cwDHl/1O85Jc
	oT0w/UDRMEBXnuHlL2Hq16NTtQMEl63CRh3WtnGDuy8y1qkuA/3R8k/14e0=
X-TMASE-XGENCLOUD: 84c028be-a697-4cab-8aad-1513a2704e94-0-0-200-0
X-TM-Deliver-Signature: E4F6707754D460BA20E432A1DE355A6F
X-TM-Addin-Auth: 0ysp/FHGOK3f5a2BcZKUEqiWE9bDHhvHXKdXtoxgpcoaJ5jV7UB6zRPrAGM
	HHf4BirnM0N1FNrEL1x8E0ifc7UiDHbe/6GSJkdLBrAGankvLVAV5U4n9R6L71HFeGMH349qEpX
	PMSG5nzLKtRIuxT+EUo/hbvNTgwXuR9ZrnjvDsVRlCOY1OL/N80jKjP82Fj6Kzp51mFXUWdzKj2
	C0c8t6tDt4GuHqV20CWUBiTuyJvICKJB9Sg7ysssrkEq82SeLqUoTAtR7dw7qtmWu5RGAYmJQ0/
	Map8lq7kiRMWwq4=.IhoHohsa+QI3xaUcpEmXYEEBku0aDFfQnExlUfjcSUixqW84je5sV8zU8m
	FnZU3qOaMIjmP21qujzUvUxeK3K1Sy5rctPiXzIyLKPo6kf5FNXrTplogmHP6m0Dx5bvJpiBtYD
	1kFH4izRMLDOyJguiyE+r/UZbm1sgNJnDhFfXz3sAEtHkbnYqbeHYezw41i6LwiV5ET1/hYTSBV
	49kvL+jI1ZOc+sfNFkoR2Y2zv+mZiUkdsts/0Vw80JFZZBFTkQ6KhEvBrYxYMvpei8jlplSlSAa
	D8uy8c9Y84ozgOtYk8UUpNazwDkA+WmyWtHaYlN94ud2OmapsgMQk69ehCw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1719496230;
	bh=plKg3WxPhprSEUx6bkKda7r9Fqg8KUDcVW7iVsTqEWc=; l=9447;
	h=Date:From:To;
	b=GzeV9QOfCFTzLEkKLQF5A8Xb+vaQ6w+Ft0RrAxUwMFik+DUfkbsE3SBp+bq+zs0Aa
	 9jtgr+ThxKhv5OxI9F/KS7Dxr32Te0P0QIM+t3S5QhpRb9oOZId0DK9iSyyCqTvh48
	 R1NHjvkea8zZicFwqYpoMC1zBmfuqjofYHH6XmLFvUSnd30ZtTm0luTzNaZTL4X3Zx
	 nV4CHUjg8NopJNHYlhosPWATQQZaFlz3DoHkNGTxsJQZeG37t9jAM/HEUoLS2PAuRl
	 zD09LmBXGtKFTDGeM0iCsdZDcthxGxgkoe4oKY4lrTFeIOFRdFvT37++MMPd42aQzG
	 Pd1kVyQ03pxdQ==

On 25.06.24 21:01, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The vmclock "device" provides a shared memory region with precision clock
> information. By using shared memory, it is safe across Live Migration.
> 
> Like the KVM PTP clock, this can convert TSC-based cross timestamps into
> KVM clock values. Unlike the KVM PTP clock, it does so only when such is
> actually helpful.
> 
> The memory region of the device is also exposed to userspace so it can be
> read or memory mapped by application which need reliable notification of
> clock disruptions.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
> 
> v2: 
>  • Add gettimex64() support
>  • Convert TSC values to KVM clock when appropriate
>  • Require int128 support
>  • Add counter_period_shift 
>  • Add timeout when seq_count is invalid
>  • Add flags field
>  • Better comments in vmclock ABI structure
>  • Explicitly forbid smearing (as clock rates would need to change)

Leap second smearing information could still be conveyed through the
vmclock_abi. AFAIU, to cover the popular smearing variants, it should be
enough to indicate whether the driver should apply linear or cosine
smearing, and the start time and end time.

> 
>  drivers/ptp/Kconfig          |  13 +
>  drivers/ptp/Makefile         |   1 +
>  drivers/ptp/ptp_vmclock.c    | 516 +++++++++++++++++++++++++++++++++++
>  include/uapi/linux/vmclock.h | 138 ++++++++++
>  4 files changed, 668 insertions(+)
>  create mode 100644 drivers/ptp/ptp_vmclock.c
>  create mode 100644 include/uapi/linux/vmclock.h
> 

[...]

> +
> +/*
> + * Multiply a 64-bit count by a 64-bit tick 'period' in units of seconds >> 64
> + * and add the fractional second part of the reference time.
> + *
> + * The result is a 128-bit value, the top 64 bits of which are seconds, and
> + * the low 64 bits are (seconds >> 64).
> + *
> + * If __int128 isn't available, perform the calculation 32 bits at a time to
> + * avoid overflow.
> + */
> +static inline uint64_t mul_u64_u64_shr_add_u64(uint64_t *res_hi, uint64_t delta,
> +					       uint64_t period, uint8_t shift,
> +					       uint64_t frac_sec)
> +{
> +	unsigned __int128 res = (unsigned __int128)delta * period;
> +
> +	res >>= shift;
> +	res += frac_sec;
> +	*res_hi = res >> 64;
> +	return (uint64_t)res;
> +}
> +
> +static int vmclock_get_crosststamp(struct vmclock_state *st,
> +				   struct ptp_system_timestamp *sts,
> +				   struct system_counterval_t *system_counter,
> +				   struct timespec64 *tspec)
> +{
> +	ktime_t deadline = ktime_add(ktime_get(), VMCLOCK_MAX_WAIT);
> +	struct system_time_snapshot systime_snapshot;
> +	uint64_t cycle, delta, seq, frac_sec;
> +
> +#ifdef CONFIG_X86
> +	/*
> +	 * We'd expect the hypervisor to know this and to report the clock
> +	 * status as VMCLOCK_STATUS_UNRELIABLE. But be paranoid.
> +	 */
> +	if (check_tsc_unstable())
> +		return -EINVAL;
> +#endif
> +
> +	while (1) {
> +		seq = st->clk->seq_count & ~1ULL;
> +		virt_rmb();
> +
> +		if (st->clk->clock_status == VMCLOCK_STATUS_UNRELIABLE)
> +			return -EINVAL;
> +
> +		/*
> +		 * When invoked for gettimex64(), fill in the pre/post system
> +		 * times. The simple case is when system time is based on the
> +		 * same counter as st->cs_id, in which case all three times
> +		 * will be derived from the *same* counter value.
> +		 *
> +		 * If the system isn't using the same counter, then the value
> +		 * from ktime_get_snapshot() will still be used as pre_ts, and
> +		 * ptp_read_system_postts() is called to populate postts after
> +		 * calling get_cycles().
> +		 *
> +		 * The conversion to timespec64 happens further down, outside
> +		 * the seq_count loop.
> +		 */
> +		if (sts) {
> +			ktime_get_snapshot(&systime_snapshot);
> +			if (systime_snapshot.cs_id == st->cs_id) {
> +				cycle = systime_snapshot.cycles;
> +			} else {
> +				cycle = get_cycles();
> +				ptp_read_system_postts(sts);
> +			}
> +		} else
> +			cycle = get_cycles();
> +
> +		delta = cycle - st->clk->counter_value;

AFAIU in the general case this needs to be masked for non 64-bit counters.

> +
> +		frac_sec = mul_u64_u64_shr_add_u64(&tspec->tv_sec, delta,
> +						   st->clk->counter_period_frac_sec,
> +						   st->clk->counter_period_shift,
> +						   st->clk->utc_time_frac_sec);
> +		tspec->tv_nsec = mul_u64_u64_shr(frac_sec, NSEC_PER_SEC, 64);
> +		tspec->tv_sec += st->clk->utc_time_sec;
> +
> +		virt_rmb();
> +		if (seq == st->clk->seq_count)
> +			break;
> +
> +		if (ktime_after(ktime_get(), deadline))
> +			return -ETIMEDOUT;
> +	}
> +
> +	if (system_counter) {
> +		system_counter->cycles = cycle;
> +		system_counter->cs_id = st->cs_id;
> +	}
> +
> +	if (sts) {
> +		sts->pre_ts = ktime_to_timespec64(systime_snapshot.real);
> +		if (systime_snapshot.cs_id == st->cs_id)
> +			sts->post_ts = sts->pre_ts;
> +	}
> +
> +	return 0;
> +}
> +

[...]

> +
> +static const struct ptp_clock_info ptp_vmclock_info = {
> +	.owner		= THIS_MODULE,
> +	.max_adj	= 0,
> +	.n_ext_ts	= 0,
> +	.n_pins		= 0,
> +	.pps		= 0,
> +	.adjfine	= ptp_vmclock_adjfine,
> +	.adjtime	= ptp_vmclock_adjtime,
> +	.gettime64	= ptp_vmclock_gettime,

The .gettime64 op is now unneeded.

> +	.gettimex64	= ptp_vmclock_gettimex,
> +	.settime64	= ptp_vmclock_settime,
> +	.enable		= ptp_vmclock_enable,
> +	.getcrosststamp = ptp_vmclock_getcrosststamp,
> +};
> +

[...]

> diff --git a/include/uapi/linux/vmclock.h b/include/uapi/linux/vmclock.h
> new file mode 100644
> index 000000000000..cf0f22205e79
> --- /dev/null
> +++ b/include/uapi/linux/vmclock.h
> @@ -0,0 +1,138 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-2-Clause) */
> +
> +/*
> + * This structure provides a vDSO-style clock to VM guests, exposing the
> + * relationship (or lack thereof) between the CPU clock (TSC, timebase, arch
> + * counter, etc.) and real time. It is designed to address the problem of
> + * live migration, which other clock enlightenments do not.
> + *
> + * When a guest is live migrated, this affects the clock in two ways.
> + *
> + * First, even between identical hosts the actual frequency of the underlying
> + * counter will change within the tolerances of its specification (typically
> + * ±50PPM, or 4 seconds a day). The frequency also varies over time on the
> + * same host, but can be tracked by NTP as it generally varies slowly. With
> + * live migration there is a step change in the frequency, with no warning.
> + *
> + * Second, there may be a step change in the value of the counter itself, as
> + * its accuracy is limited by the precision of the NTP synchronization on the
> + * source and destination hosts.
> + *
> + * So any calibration (NTP, PTP, etc.) which the guest has done on the source
> + * host before migration is invalid, and needs to be redone on the new host.
> + *
> + * In its most basic mode, this structure provides only an indication to the
> + * guest that live migration has occurred. This allows the guest to know that
> + * its clock is invalid and take remedial action. For applications that need
> + * reliable accurate timestamps (e.g. distributed databases), the structure
> + * can be mapped all the way to userspace. This allows the application to see
> + * directly for itself that the clock is disrupted and take appropriate
> + * action, even when using a vDSO-style method to get the time instead of a
> + * system call.
> + *
> + * In its more advanced mode. this structure can also be used to expose the
> + * precise relationship of the CPU counter to real time, as calibrated by the
> + * host. This means that userspace applications can have accurate time
> + * immediately after live migration, rather than having to pause operations
> + * and wait for NTP to recover. This mode does, of course, rely on the
> + * counter being reliable and consistent across CPUs.
> + *
> + * Note that this must be true UTC, never with smeared leap seconds. If a
> + * guest wishes to construct a smeared clock, it can do so. Presenting a
> + * smeared clock through this interface would be problematic because it
> + * actually messes with the apparent counter *period*. A linear smearing
> + * of 1 ms per second would effectively tweak the counter period by 1000PPM
> + * at the start/end of the smearing period, while a sinusoidal smear would
> + * basically be impossible to represent.

Clock types other than UTC could also be supported: TAI, monotonic.

> + */
> +
> +#ifndef __VMCLOCK_H__
> +#define __VMCLOCK_H__
> +
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +#else
> +#include <stdint.h>
> +#endif
> +
> +struct vmclock_abi {
> +	uint32_t magic;
> +#define VMCLOCK_MAGIC	0x4b4c4356 /* "VCLK" */
> +	uint16_t size;		/* Size of page containing this structure */
> +	uint16_t version;	/* 1 */
> +
> +	/* Sequence lock. Low bit means an update is in progress. */
> +	uint64_t seq_count;
> +
> +	/*
> +	 * This field changes to another non-repeating value when the CPU
> +	 * counter is disrupted, for example on live migration.
> +	 */
> +	uint64_t disruption_marker;

The field could also change when the clock is stepped (leap seconds
excepted), or when the clock frequency is slewed.

