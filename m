Return-Path: <linux-rtc+bounces-1365-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C318A91044F
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Jun 2024 14:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFF941C20D82
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Jun 2024 12:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219D41AC438;
	Thu, 20 Jun 2024 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="Mnxs2hez"
X-Original-To: linux-rtc@vger.kernel.org
Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AC617624F
	for <linux-rtc@vger.kernel.org>; Thu, 20 Jun 2024 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718887090; cv=fail; b=eCwI9magf+AGLqAxUA2aU5C7kmPwU/uGut5s/4OTzG6PPFpb9KVaqyUkDpNrN5oM80Y9Turb+hZnAvmW2y7p9JQyXudVohM8ypza+nn1mGkEccs5ZMmVi1gmvAVetwVwLVvGPtLAwynR549Pn3NYa1MFwhYL+Rwl0lKO48jhGRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718887090; c=relaxed/simple;
	bh=TlzqEywQ2W/SuIIripKsxRob5VA1f4R1Wpi/7A50LzM=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oBSDyTtQVy04Dcp0+8JqdT/NRtwf0orWU5RdW5A4ZQySFGydyz0zN3xwaxyT4A2ZlvzkXtrCLQ1HGFQ6V3CW4P+okyLuzv9j2cEQjfILj+xRSCZpiBwVy1P1CYpFos9YQBH/uWh5qWPY2O0ep9xoEf9J3tc5AgcDtDgviLB0/K0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=Mnxs2hez; arc=fail smtp.client-ip=18.185.115.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.19.51])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 995B410066469
	for <linux-rtc@vger.kernel.org>; Thu, 20 Jun 2024 12:38:00 +0000 (UTC)
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.162.72])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id EFD82100004FE;
	Thu, 20 Jun 2024 12:37:52 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1718887069.700000
X-TM-MAIL-UUID: 290cb50d-fe52-44ce-8b91-8b5241f04748
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.168])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id AB20F100058D9;
	Thu, 20 Jun 2024 12:37:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebOqxYXToU8QMKNKPfBGNMHLEkcD4nxwkFb6Zd0LTycU3HXPQHk3K0XHX1oxIiTLjCsmZZ70as1YC83Hk2zLPULX3ZX+wMu3S/ut+wW9GwtRieHBSY+Eqem+oFxdJrUlHEWizTNyuoSDE4MpYokiv5XJ9OIvTrDtRad1430GqZ18fb7Awdg9hgEEVjtipEfs8RwozseNZOCNRmcdWL7r+YFr9rR169dVMejL4gkkJTFn+XJMtgZ7oxu9JjGZjkFKQo9sQgv5aYDnPSqwo211oZ9zG+lP7KqaEsK+hEpWY3zRUe5/xJvTMnaew3vGV4wPFBjHVsk2C2Jc/J32vWq1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnN2le7tnXd8HhptCkxMZPFDC8xgJYpSuG/X/dzuauQ=;
 b=fRkdTdvMejx/mWm/Kk7a2BD0u1W0jtMc9Bcmm5mTbeFxO7PpKcbCnnGM8XAJmOnaVKYspVSeBq1o9FcUIvWqZfN/e+WJW55VXQx2e58yru2t/GhExvVT0O9WQ7zaUBqLjFqWbY9WDrGQx2UrQG5QUzk3Ny5VMXTqO4gNPgi9wP/GAEDnQ0AZpdFLSyBJGhtfVe5z9s7unsfr93UGt0UYsISSJMuwrjJ+dQQdc7N4N6FY0rjOlFyTyQI7gtlDBDkRHGITQwD6g009n+8fNqNL3fSN4cWXDoM1ysKq4Fl1MN1oIu33Awiz6vctORB+n0zIyUZ90aJX799neKk3BAvttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com>
Date: Thu, 20 Jun 2024 14:37:45 +0200
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
Content-Language: en-US
In-Reply-To: <684eac07834699889fdb67be4cee09319c994a42.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0286.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::13) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|FR0P281MB3116:EE_
X-MS-Office365-Filtering-Correlation-Id: 8827010d-8d79-4a67-d061-08dc9125ca96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|7416011|366013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVRkTTgzNll5RllrWlI0UElla0xIclFCaEpSbXVKNHRsRXdleHY2Y0F4alBV?=
 =?utf-8?B?RnVCb3BQSW1pcUwvV0pXUk82L0JHL3FPbVJabCtTc3VxdzFKTXJlWG92NXIr?=
 =?utf-8?B?RTMvcFB5ckFGY0xiNUFSbmlvdFU5VElaM3IrdnFMZ2lybEVTZGVYQXlvcDI5?=
 =?utf-8?B?T01PK1REdXBERDNNTWJlSlFwcGZQb3JoRW1jZ21sT00rTDBSYnF1aE1sU2ZD?=
 =?utf-8?B?ZzFBRXNhZWlzb2xWa3FaNGhBU2V1dFpxMmEyWk1JYWpnSWp1U0NCby9jWGxj?=
 =?utf-8?B?MTdNMm9EaFlsVy9tRzlBNGFiNTJ3UVBhT1VaZC9MZXFFMUVmSmxudGVDeEFy?=
 =?utf-8?B?am5scXlCTDFVUk1xMzRta0VBQmo0RHRpQ01SQkhtV014K2c3YjArTFo5Y2pm?=
 =?utf-8?B?MWF4Y013MXpjejJLNFd0NTREeU1zWEtsLzEwc1BLRWtyK1Y2WG1PMkpKVUJm?=
 =?utf-8?B?cGdHaThjTEhFUXdvdVBSVzdaRVlOQmpTYUNHbFQrS0dXcWlRdXMrK0xzWGN5?=
 =?utf-8?B?MFNxNDNUbzVvY1lRUnkrblZ6SzYzZ2ZjbmFMN3NFalAxRHF0N1NrRUF1SFBx?=
 =?utf-8?B?U1pEMHVCaFNvK1lkeGNsUmV1dU1sY2pXS3JJK1IxZDgxUmpRcXRlK01VMEZK?=
 =?utf-8?B?U0p3VUNJeG5mVENjaEd1eTRVT0h5VlM1K05tVFlSWWwrb09PRTNhZVU4ZDE0?=
 =?utf-8?B?cUJrQnBzZ1VwbmdrYllHZi9nWGJ4UnhzUUN5SVVORDVVUnRIa0VGWHB6NEdX?=
 =?utf-8?B?RE1vakdpNXg3K2ZyRURiYmNlMEt1cE9MRTBqb3hYM1lGTE1nL1FHZE1HUis1?=
 =?utf-8?B?Y2puQ0pDcWg1UG94cGtBSzR1ckNBVi8yY2JYQitBRGRtQWJpU1pEczZCWUps?=
 =?utf-8?B?S0E3bmRjRlFvcXlGTlZ4UjRRRWhsNkJFQ1ppUndVamVtWHI2cEs5NjRDSjFI?=
 =?utf-8?B?Sm85ZjNIeW8wV3R2M04zZS96VU1RSm1rTk1iTkp6cGE5MFlON2VtZ08rSUt1?=
 =?utf-8?B?UzVTQ2ZwUXNGbWduRVduTElGdEZUY1dLUURXZWkzNGx1U0NsVEo1ZCtRNHJz?=
 =?utf-8?B?VklGMmJEOUF3QUpTc3MwaEZDRmdWU1VYWEtzd3MwbmpCTVdhZEN4L2ZHZkVY?=
 =?utf-8?B?bzdaOGVmeDlpTy9lMDNQSzJDcnM0RWVRM3pBRkxmbHNXNzNYRWRHdXR6UnR1?=
 =?utf-8?B?ZVpGRWN4ckVEajh1bVNlaGVKSFRhNTJwdW8zcXJIK0FlSVZmY1lNc1F3Q2VJ?=
 =?utf-8?B?RkoyR1hIZDA3WkJ6aE94QVVxYVpWVytVTEhkbkJUcDhkdDBnbGpOMG1EK1gx?=
 =?utf-8?B?NzBCQmVUQk9va2liMjROdmsvU2tWR2F2NENmU3BpTnBIQTUrMUJBY2d0d2wv?=
 =?utf-8?B?M05Kb1ppWDdkMm00RERhdmMzOElXaSt4YXpLWkxOTFg3QnpES1NsTnBlN1Nq?=
 =?utf-8?B?ZGwxY0c1Q0s2c1ZRVEtjV2k2Ynk2T1pYT3ljRjgvaVIxUnZWZk1hbDNTRVBp?=
 =?utf-8?B?a1JLaXgySXpZbS9CTmcrZWpiR0tCSzlNMDR6dkpXZHdLMGFDdWkyRjlUZTd1?=
 =?utf-8?B?TVQzMVdVU1VvejBqU04rOGtiWm5NOEFwbCtGcEVzNmZxVlAwWUxiTjJyZnlZ?=
 =?utf-8?B?d0VWT2ozRmE0Z3dyb1dNVFFPc3BNRmdMajU5SDdkYVRURXFhSEJEa1M5WVc2?=
 =?utf-8?Q?I4JR3x/pvzQAfyUUqT3x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(7416011)(366013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHlyeDdlbnBpdkN5WFNaSnZ1dnI1NlFLSzRMUXo0TVYram9JWEFCTmtpNkRl?=
 =?utf-8?B?dkZEekxsazRBaVJKVDJFUXBmTDRuVzJxdHF3S2tyU1lRMGx1Q285aW5JWmtU?=
 =?utf-8?B?MlZFc3JiMy9EMTRUYXF5ZUlvSmk3dG9SbHR4U1g4RkU5R0lEbzVCYk5SeGRx?=
 =?utf-8?B?d3IzSUlDOWRnSWJGRUh2ZERYL2xGVVJNN09RclVHRm5FZmpqbkZOMU55OVhN?=
 =?utf-8?B?eDhSRDdNbzVZOXhnZ2p4QW1VaGgzQlJiK1Raa2IxWHRZNXJWcnFOdUtINlZ4?=
 =?utf-8?B?b0ZCckYwOHBTQ1B2V1lGbEI5bTNkNGxWKy9GUVgxM3FrWVBQRUIwcWYxOFJG?=
 =?utf-8?B?NU5YMnJRaEw2NVR3YzlHZEVYQlQ1SGswR1JIclR6Y3FVUHN3d1pZUTRtQWtl?=
 =?utf-8?B?ZW5BUTlydEIvSGRxd3dhWDVQSkFjbllJWGZ5WS9XbXVlRFFzb2RwRko3N3RK?=
 =?utf-8?B?b1dQbm5WMjFxQ3k0WklvaWdkQ3V1SDdFbjFnWmxiMytKWWg5VzhjTGZISU1W?=
 =?utf-8?B?ZTlDOE1Mczc5alFReWdFV1BMZ0ttTUFsOE8xS3M2b3EzZ3RzeEdCY0J6UGJJ?=
 =?utf-8?B?MTc0UFNBWURMSElXY1k4ZWpqQjhHcmFTTkM5SWJUL3VpZnNaTnB0YTVjS2JU?=
 =?utf-8?B?d2pqMFFkWVArbTVBTzkxTHRhSUx2R0lzNXF2UlVPM0gycUw3akhGQ2ZRMG5N?=
 =?utf-8?B?dXFtOHN3eGcwVCszRERnMExhZXY4S29OdHR1VXNkZmVkOXJSbmY1dEdSNVhN?=
 =?utf-8?B?eTJ4NnVqVmU4dUtYS0RyOGlDemFTWFdsU2N5OXVRdjJXVUNlbTNDSXZQd1kr?=
 =?utf-8?B?bFRiOEZKMEg4aWljVUw3SWc5eUJzN0ZtRGx0amVoNnJIK05zc2NaaWRxaDh2?=
 =?utf-8?B?cytmd21Rd0JTa2FSRGJDazJYZ2I2cVovMTFDQUQ5MW9nRWZBVFEwejd5WG5O?=
 =?utf-8?B?VWZGOUNHa0l0ZXFMZ080UGx1ajcxOXVCcmYxUmpwZ3FHUUdUOVZKeGNEQlcv?=
 =?utf-8?B?UFhwOXNVVnlvWHF1YUQ3dmtVaWN1Ym13bkczN3hmVWtHV2J0S1hTTTE2NzdU?=
 =?utf-8?B?MFltb2lKWHZNR1FjUEVVOVFLNkhTVkdiK3JVOCt3amhMdEVQcjJqek5mZlhr?=
 =?utf-8?B?Vkp2bU1odTRYOEV5UVoweDRaMi91aW9jOHY3KzlRcklaRUhWMGIwYzZzZ2hu?=
 =?utf-8?B?NGZiRE9jcjliYTFMMS83RWgrTjZwaFVvdmxya2s1SjQxK1h0am1Mc2FNQWFs?=
 =?utf-8?B?R2xuZ2ZjTTI3TmFFYzJaSWpOTUZIVzFsZXREWHdadUUwdmZrR0RpQnQ4MExw?=
 =?utf-8?B?Z1dxMlR2YWpDK2FMd0REbFNyRUN6VWxUOXN6RTM4SjhaVkE4QWtoYzFzRWFU?=
 =?utf-8?B?dFJwV1dWR2RwZFUzamVFRzV2UWV5dDVEdWxtY0JhQkRrY1NlNi91NExpQ2ta?=
 =?utf-8?B?SmxVVjN0R095Z3FDeFZTbTMyZFhXVzNFOG1UVFJZZzlOSG1GeHNKaG5IZEl4?=
 =?utf-8?B?QWhadytGdkQ0YVBiT1JXcm90QmE1WHlIMTlGOFdQRGo3QTRZdXBFd0FoTUpK?=
 =?utf-8?B?TzNFeDhBbHhzMi93aDRsdmw4OTRCYjYrSlVPYlFUbjZ3SkkrTFQ2cG44Um1K?=
 =?utf-8?B?YWU0RUVSSGVXNDFabFFHZzNwUGRUWVAzQmpFNkdVcjR2a2FNT200d2NzYXBY?=
 =?utf-8?B?bGNZVm1XRy9pODdSRm1CY0ZpU1NFMkh2a1ExNmNPdTY5YlpRSWIxd1A2VE5o?=
 =?utf-8?B?TENYV2VCSlY3Y1lVeXdlQTROYmVubFRWcVlXVzlqVWRxZlFNNUEwSndGUVNn?=
 =?utf-8?B?K3BZclVIUmVVL1JjL3RDam56RTVmcHd4NU41R3MwaUR6aEpFOTlrdzNJUmVx?=
 =?utf-8?B?Q3hXQmU5VUpwUHJnK2FFZURnd0pSenVaL2lvZGNsY0xlNFZLazFuekdKT0lh?=
 =?utf-8?B?d3dpUEdZNW1aM2g3MVZjdXpXcHJQUVlrODY0dWJkdmhmMEtqT3pvRHA4Q3VD?=
 =?utf-8?B?aXgza1dvL25UR0NPN05Ra3pmb1RScGpJbjBJdkIwd2pISWFLblVpTnZxWGQr?=
 =?utf-8?B?UWU4dWZLaGVLcDdCM3ZLYkhTZzNHOTd3UGIyM1NxaXJTY2hWUDVGOThhSkEv?=
 =?utf-8?B?NTVtM1crNElCUnpTdWd2NUlDd1hQckxNWS91YVJrTy9YVVVhVURldVdDZVBW?=
 =?utf-8?Q?SAlUQMMs6rgGMXTAiHfCajcYJNAxQwSM+ESGb4k2I/5t?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8827010d-8d79-4a67-d061-08dc9125ca96
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 12:37:47.9609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duP0zQw/L96Q0SU9NMBK6ZMpEaSYC5foafkFExy2ZIFnejZZL58kDS9/vusx867KiWLr8bDZq0WKZx2ntHxHig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB3116
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28464.007
X-TMASE-Result: 10--24.067800-4.000000
X-TMASE-MatchedRID: fcW4EIiZv5LEeENaa6f3ihj1uEat0f0XVj1dhrWbzEC6wG+1uTW14IuV
	G0d8rk2TrUCvW535VRUd79Smn/h5xPFF4+z5i5UcorwbUIAmUaJ4lyF1lyvUrVpMWq1GqY9jmWz
	l7F0zZQWZoJHe3NJpJT2pvuBV4chPOGpdxecJtwbsc6QXz75WbPfKbx7F+zg4jFXvQgMRreVvT9
	VveGmqD7e6urPFlSt5Orkhbrec/4dHVNDBbYy+kJw+xisqOyN8v7Lz4u+POQaVmuhG06IIbYvXa
	ntxmoFYC+iyfs1TRXaMl+XngjY4wjCApaIh+p+E/jNCC3aZLAkkKbcMlSR3PM5hvaZoPJ3Ca6hV
	coF3xeUz9GkRd2C9jjOl7yao26nTMpcziuAQraeAPVJIs1LbIdKVGtUbacqD1ejrBAMhwMMzVAx
	INNFOZphuFzPsYdoM1QlqBiye6E6esoJx4XaHZbo+fojTKD8b4WMcbQqR5OFwWiaCFb12m+biR+
	ph1AkZWaJL+V0l8L3cU2SOhfToQA9UlA3N+MhzBluC4Zp4rUmFhGp9GNPDrdDDQ0JNLQ+q1McWg
	5VNQo//+yEhEMlozdDnhWrvupqyu7LvDM6Gr9AdUGQOzoveRXQK0rQOCABeDZN9Uzz/E7Ta5ufE
	KOt4nxPOq1cdIHlXQ8bjLBL2gMFOYwV5h6aeTKQpH03ACS9WIa6dt2YeBvCbyUSNdkyqzt9SWyy
	tvQq/6m5JJ8VFuW9hbKuwJkPkeLHp+ukkV/8w8vMj2uaAsJdIhbHCNJtZqCMkNiGdYPMmNrLho6
	OLWUlFcy4vmHdT1AjxrWYrxjq+RgJOi57JZ3Py5NgBTdbLpzmoMBkrmuf/mCYM4MaoFU97wQPQv
	9XohUiWqV2CUL6T0PrEu9fgzgiAnDiIfwG3KVlks+Ha40i4YppqMItbEgOI/kD+1oWNGTP3xblV
	FHYboli4ZoiOHT8g4pZYxslhbQ40qJRZ9yNbA/3R8k/14e0=
X-TMASE-XGENCLOUD: 5aa4c864-52b7-4b33-aff8-fb9ce001e1cb-0-0-200-0
X-TM-Deliver-Signature: 18C49756892C5AB6225BF3CE1FFD7991
X-TM-Addin-Auth: 0S75YcFR2yBQ5SW6iXzQ+KfgfySVzQUsMKpZ0kEe85aFj1oIvPZzswoKWyI
	0wQcbkzQnFMCtuTLS3/2DicRM4Ef3XJXMo8Q0YC9dDaED8entAbgQzxkym46yp/ga+e0IY4g9tI
	CcjvwfIIIKZf8JZsWF1PG+4o0Sslq+bN9BonYesSSckE+XCja8Qvv3HSjApt5mZc6OpjG+1VPwN
	zQAwcnV93MOcuqdoBfl5HladUehhH/5bfWQCOrnNKYCtD0ebJ3vM9CytBkOkcK8k8d/Wygqey5H
	qVANBhQIicqVDqs=.uvEbxML7wDeQMWnb+3V8FRe08SkFo5zQogtKRYe32ZTKhNZKWNb1s5mesk
	dFoC/MYwLb/S+3RoPPW6QF3n7U8CQ0rEK8Ie3SVVV+WWwPMz2xmq1nSLbvDM9pLt7VrdkwcHdnk
	jVaMsJia4mQ6G8U5Y1kUbnX+QpehsM80gAbtofnfysSHcGTc1VmOyt3qUtqGxYHYcFbVf5AOqop
	L47r8aFqBg1q9u6zY2aj4AZmHtxtu3hg5Ekt7DeTTQasVpCgqGvmP/B5idUOPnK7FSo5kWGaCAk
	NBxrD1bG5/MVII5OO5sWNZ7e6QQuG3l5Joz08xtEDoOQCmbN5+8nisGH6+Q==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1718887072;
	bh=TlzqEywQ2W/SuIIripKsxRob5VA1f4R1Wpi/7A50LzM=; l=11452;
	h=Date:From:To;
	b=Mnxs2hezT2qWbpW2s5p8KFt7J4u4Ch2TAiT3fEqqdNpA+2w0bf8EQYpPGOo3NojPz
	 KVhU2XWJji/b5drkNiBHkyRz7FD1akPwnN8ZCCZJ46R5rqs1zbuZ8SRbDphQXIN8JF
	 JgdSDF5CMcMgVh2m0Yba3lHVfWop55gBuHBUHDOXi4jxtK9JBrWQ3i2CDfeyFJmgvI
	 1cZMCj9mz6pFb5ZHZw8bEUtl8BlibPWReVAMTPdDyday8D73hn2L17ecLqSEkn9hou
	 h1mDLgAc85W1zi2SYYc9f9Yu/nIKX96qIOdqsJFpw1fDydBL81CTxE8wqOEWobzuS2
	 9v6uY2OIbmsUA==

Changing virtio-dev address to the new one. The discussion might also be
relevant for virtio-comment, but it is discouraged to forward it to both.

On 15.06.24 10:40, David Woodhouse wrote:
> On Mon, 2023-12-18 at 08:38 +0100, Peter Hilber wrote:
>> RFC v3 updates
>> --------------
>>
>> This series implements a driver for a virtio-rtc device conforming to spec
>> RFC v3 [1]. It now includes an RTC class driver with alarm, in addition to
>> the PTP clock driver already present before.
>>
>> This patch series depends on the patch series "treewide: Use clocksource id
>> for get_device_system_crosststamp()" [3]. Pull [4] to get the combined
>> series on top of mainline.
>>
>> Overview
>> --------
>>
>> This patch series adds the virtio_rtc module, and related bugfixes. The
>> virtio_rtc module implements a driver compatible with the proposed Virtio
>> RTC device specification [1]. The Virtio RTC (Real Time Clock) device
>> provides information about current time. The device can provide different
>> clocks, e.g. for the UTC or TAI time standards, or for physical time
>> elapsed since some past epoch. The driver can read the clocks with simple
>> or more accurate methods. Optionally, the driver can set an alarm.
>>
>> The series first fixes some bugs in the get_device_system_crosststamp()
>> interpolation code, which is required for reliable virtio_rtc operation.
>> Then, add the virtio_rtc implementation.
>>
>> For the Virtio RTC device, there is currently a proprietary implementation,
>> which has been used for provisional testing.
> 
> As discussed before, I don't think it makes sense to design a new high-
> precision virtual clock which only gets it right *most* of the time. We
> absolutely need to address the issue of live migration.
> 
> When live migration occurs, the guest's time precision suffers in two
> ways.
> 
> First, even when migrating to a supposedly identical host the precise
> rate of the underlying counter (TSC, arch counter, etc.) can change
> within the tolerances (e.g. ±50PPM) of the hardware. Unlike the natural
> changes that NTP normally manages to track, this is a *step* change,
> potentially from -50PPM to +50PPM from one host to the next.
> 
> Second, the accuracy of the counter as preserved across migration is
> limited by the accuracy of each host's NTP synchronization. So there is
> also a step change in the value of the counter itself.
> 
> At the moment of migration, the guest's timekeeping should be
> considered invalid. Any previous cross-timestamps are meaningless, and
> blindly using the previously-known relationship between the counter and
> real time can lead to problems such as corruption in distributed
> databases, fines for mis-timestamped transactions, and other general
> unhappiness.
> 
> We obviously can't get a new timestamp from the virtio_rtc device every
> time an application wants to know the time reliably. We don't even want
> *system* calls for that, which is why we have it in a vDSO.
> 
> We can take the same approach to warning the guest about clock
> disruption due to live migration. A shared memory region from the
> virtual clock device even be mapped all the way to userspace, for those
> applications which need precise and *reliable* time to check a
> 'disruption' marker in it, and do whatever is appropriate (e.g. abort
> transactions and wait for time to resync) when it happens.
> 
> We can do better than just letting the guest know about disruption, of
> course. We can put the actual counter→realtime relationship into the
> memory region too. As well as being able to provide a PTP driver with
> this, the applications which care about *reliable* timestamps can mmap
> the page directly and use it, vDSO-style, to have accurate timestamps
> even from the first cycle after migration.
> 
> When disruption is signalled, the guest needs to throw away any
> *additional* refinement that it's done with NTP/PTP/PPS/etc. and revert
> to knowing nothing more than what the hypervisor advertises here.
> 
> Here's a first attempt at defining such a memory structure. For now
> I've done it as a "vmclock" ACPI device based loosely on vmgenid, but I
> think it makes most sense for this to be part of the virtio_rtc spec.
> Ultimately it doesn't matter *how* the guest finds the memory region.

This looks sensible to me. I also think it would be possible to adapt this for
the virtio-rtc spec. The proposal also supports some other use cases which are
not in the virtio-rtc RFC spec v4 [2], notably vDSO-style clock reading, and
others such as indication of a past leap second.

Compared to the virtio-rtc RFC spec v4 [2], this proposal does not seem to
support leap second smearing. Also, it would be helpful to allow indicating
when some of the fields are not valid (such as leapsecond_counter_value,
leapsecond_tai_time, tai_offset_sec, utc_time_maxerror_picosec, ...).

Do you have plans to contribute this to the Virtio specification and Linux
driver implementation?

I also added a few comments below.

Thanks for sharing,

Peter

[2] https://lore.kernel.org/virtio-comment/20240522170003.52565-1-peter.hilber@opensynergy.com/

> 
> Very preliminary QEMU hacks at 
> https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/vmclock
> (I still need to do the KVM side helper for actually filling in the
> host clock information, converted to the *guest* TSC)
> 
> This is the guest side. H aving heckled your assumption that we can use
> the virt counter on Arm, I concede I'm doing the same thing for now.
> The structure itself is at the end, or see
> https://git.infradead.org/?p=users/dwmw2/linux.git;a=blob;f=include/uapi/linux/vmclock.h;hb=vmclock
> 
> From 9e1c3b823d497efa4e0acb21b226a72e4d6e8a53 Mon Sep 17 00:00:00 2001
> From: David Woodhouse <dwmw@amazon.co.uk>
> Date: Mon, 10 Jun 2024 15:10:11 +0100
> Subject: [PATCH] ptp: Add vDSO-style vmclock support
> 
> The vmclock "device" provides a shared memory region with precision clock
> information. By using shared memory, it is safe across Live Migration.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  drivers/ptp/Kconfig          |  13 ++
>  drivers/ptp/Makefile         |   1 +
>  drivers/ptp/ptp_vmclock.c    | 404 +++++++++++++++++++++++++++++++++++
>  include/uapi/linux/vmclock.h | 102 +++++++++
>  4 files changed, 520 insertions(+)
>  create mode 100644 drivers/ptp/ptp_vmclock.c
>  create mode 100644 include/uapi/linux/vmclock.h
> 

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

Should implement .gettimex64 instead.

> +	.settime64	= ptp_vmclock_settime,
> +	.enable		= ptp_vmclock_enable,
> +	.getcrosststamp = ptp_vmclock_getcrosststamp,
> +};
> +

[...]

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
> + */
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
> +
> +	uint8_t clock_status;
> +#define VMCLOCK_STATUS_UNKNOWN		0
> +#define VMCLOCK_STATUS_INITIALIZING	1
> +#define VMCLOCK_STATUS_SYNCHRONIZED	2
> +#define VMCLOCK_STATUS_FREERUNNING	3
> +#define VMCLOCK_STATUS_UNRELIABLE	4
> +
> +	uint8_t counter_id;
> +#define VMCLOCK_COUNTER_INVALID		0
> +#define VMCLOCK_COUNTER_X86_TSC		1
> +#define VMCLOCK_COUNTER_ARM_VCNT	2
> +
> +	uint8_t pad[3];
> +
> +	/*
> +	 * UTC on its own is non-monotonic and ambiguous.
> +	 *
> +	 * Inform the guest about the TAI offset, so that it can have an
> +	 * actual monotonic and reliable time reference if it needs it.
> +	 *
> +	 * Also indicate a nearby leap second, if one exists. Unlike in
> +	 * NTP, this may indicate a leap second in the past in order to
> +	 * indicate that it *has* been taken into account.
> +	 */
> +	int8_t leapsecond_direction;
> +	int16_t tai_offset_sec;
> +	uint64_t leapsecond_counter_value;
> +	uint64_t leapsecond_tai_time;
> +
> +	/* Paired values of counter and UTC at a given point in time. */
> +	uint64_t counter_value;
> +	uint64_t utc_time_sec;
> +	uint64_t utc_time_frac_sec;
> +
> +	/* Counter frequency, and error margin. Units of (second >> 64) */
> +	uint64_t counter_period_frac_sec;

AFAIU this might limit the precision in case of high counter frequencies.
Could the unit be aligned to the expected frequency band of counters?

> +	uint64_t counter_period_error_rate_frac_sec;
> +
> +	/* Error margin of UTC reading above (± picoseconds) */
> +	uint64_t utc_time_maxerror_picosec;
> +};

