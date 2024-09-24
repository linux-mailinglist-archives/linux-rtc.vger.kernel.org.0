Return-Path: <linux-rtc+bounces-2052-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 305E7983BFA
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Sep 2024 06:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F5CD1C21C4E
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Sep 2024 04:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1781E22F19;
	Tue, 24 Sep 2024 04:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SnivXRzQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3787A28F3;
	Tue, 24 Sep 2024 04:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727150897; cv=none; b=VXLeXJ4n0Nb5BA63jU24gBvhKeQod0QTIk94dRTum9acN6OrY4I0X+4NyG/7FGuqd/Lhyk7NfS8gHyRXdDbTOSLPyCPurVudZj+H3KhUWQwMMAo4l4IuFgXi8aOb69t2Myz22PryGpLHUW+sXtoVgFvMe3vbfqezXPEnP4balGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727150897; c=relaxed/simple;
	bh=e3HOsa5pozp8OHR4hKQFX/TQIkoaPX58rjFNrHaMCrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P0REdOPoPvbLQnGMmmhMUnuVh45P5DLV5oqOjdy2KPRoejrSk+2yyRWGY3jEGTqrEfrx9qE9NQqOX4g9jKRSFad3kPMxM91KzePvyWTp/QvpI2PtFoJXmOm+mvstflQrqGJSZcH/5hyEtTHUBAakO7MHoTSYZCSWDxjm23Tnyrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=SnivXRzQ; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9afaa75a7a2a11ef8b96093e013ec31c-20240924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=lhUlNSypZsjISyjSJbKAwiwST2xLdo0AkzrMaosZ+hw=;
	b=SnivXRzQZDfgxzfNDJRYLh3r62m/7G9YGNiVgpAxNubVPECQH4wmKoKZ82ldWRUJf31gDkW3ItX0JOacl6RpHOD/qrmmHRt9Zdqu4H3nQjnV0921gLDqH6SylPUw/OOOe3yXYVEbIyr+/iejOsx7kWfBuUqy+EWiqtz8QUe/T2c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:3d9e494d-2a69-4ae1-849b-3bdb24fe7561,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:97a6759e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9afaa75a7a2a11ef8b96093e013ec31c-20240924
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1931946160; Tue, 24 Sep 2024 12:08:07 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Sep 2024 12:08:06 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 24 Sep 2024 12:08:05 +0800
Message-ID: <0748868d-4789-fcaa-e70f-6a4508411b36@mediatek.com>
Date: Tue, 24 Sep 2024 12:08:04 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 2/3] rtc: mt6359: Add RTC hardware range and add
 support for start-year
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<lee@kernel.org>, <ZhanZhan.ge@mediatek.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <eddie.huang@mediatek.com>,
	<sean.wang@mediatek.com>, <alexandre.belloni@bootlin.com>,
	<sen.chu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<kernel@collabora.com>, <yong.mao@mediatek.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-3-angelogioacchino.delregno@collabora.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20240923100010.97470-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/23/24 18:00, AngeloGioacchino Del Regno wrote:
> Add the RTC hardware range parameters to enable the possibility
> of using the `start-year` devicetree property which, if present,
> will set the start_secs parameter by overriding the defaults
> that this driver is setting;
> 
> To keep compatibility with (hence have the same date/time reading
> as) the old behavior, set:
>   - range_min to 1900-01-01 00:00:00
>   - range_max to 2027-12-31 23:59:59 (HW year max range is 0-127)
>   - start_secs defaulting to 1968-01-02 00:00:00
> 
> Please note that the oddness of starting from January 2nd is not
> a hardware quirk and it's done only to get the same date/time
> reading as an RTC which time was set before this commit.
> 
> Also remove the RTC_MIN_YEAR_OFFSET addition and subtraction in
> callbacks set_time() and read_time() respectively, as now this
> is already done by the API.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/rtc/rtc-mt6397.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)

[snip]

Thanks for helping add new patch fix for RTC.

> @@ -302,6 +293,10 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>   	device_init_wakeup(&pdev->dev, 1);
>   
>   	rtc->rtc_dev->ops = &mtk_rtc_ops;
> +	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
> +	rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
> +	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
> +	rtc->rtc_dev->set_start_time = true;
>   
>   	return devm_rtc_register_device(rtc->rtc_dev);
>   }

Dear @Zhanhan, Please help to leave comment if you think there is 
something need to be clarify. For example, I've found some relate origin 
defines
in "include/linux/mfd/mt6397/rtc.h"
#define RTC_MIN_YEAR	1968
#define RTC_BASE_YEAR	1900
#define RTC_NUM_YEAR	128
#define RTC_MIN_YEAR_OFFSET	(RTC_MIN_YEAR - RTC_BASE_YEAR)

Should MediaTek remove RTC_MIN_YEAR and RTC_BASE_YEAR in next patch?
And since there may not exist any smartphone/tablet/TV using mt6397
RTC earlier than 2010? Is it possible to change
RTC_TIMESTAMP_BEGIN_1900 to RTC_TIMESTAMP_BEGIN_2000 without breaking
compatibility for these devices?

Thanks
Macpaul Lin

