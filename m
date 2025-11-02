Return-Path: <linux-rtc+bounces-5239-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 275A0C28A26
	for <lists+linux-rtc@lfdr.de>; Sun, 02 Nov 2025 07:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A2250347E67
	for <lists+linux-rtc@lfdr.de>; Sun,  2 Nov 2025 06:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F2C1E834E;
	Sun,  2 Nov 2025 06:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kumba.dev header.i=@kumba.dev header.b="bgLG4Qja";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Yq1tYrnM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A1C15D1;
	Sun,  2 Nov 2025 06:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762066309; cv=none; b=NzqZ11dvhPcnKFKSCiFBi6AYttMEEdH+eH6LgcHyxTQhz29vNtWOxYGVTp+myaGGGNG1/0yy8Peof7qwmBKJkkAtlveI6nYbmnpT+qow9aXByOYhGrEjMatD9igXVwp9O0K/vi9GdLWPTV/VdhN/41CJkZfnT5aaENFWxwiQy1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762066309; c=relaxed/simple;
	bh=jrQu8QUh8d9O2x9Oj7sYWD8ZIaTpf5wTovtM+X5aN5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6onsYHQs5GlXtEoHn0b1uVnSf/ThFbHWHcAW0f+yy+WyJZeC0Va0Iz0QiPyF+TgYEbDwFu3wClwmoghlBWvrsfUcfIQhG95BoFJgvxTUMeMSW4elAcGoiUgLyqzCbcYV99aeZhfp4HEaXIg/ZWeXysv8YkILvuvO8OVbHZuRQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kumba.dev; spf=pass smtp.mailfrom=kumba.dev; dkim=pass (2048-bit key) header.d=kumba.dev header.i=@kumba.dev header.b=bgLG4Qja; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Yq1tYrnM; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kumba.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kumba.dev
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4B4147A00DA;
	Sun,  2 Nov 2025 01:51:45 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 02 Nov 2025 01:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kumba.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1762066305;
	 x=1762152705; bh=2MPoV+MTAdGoRJUdgFuhFNIxbSRUWNHncLFL41VMeVI=; b=
	bgLG4Qja5OnD5U6AJfeiez9W8Tx1w22un38jRl8aDxiaf8DT41k1wm0bBpka5auI
	15XNH7NnzWSjZ0uteB8K7u7SU/+CYrhyLjK/3XVXPpFCswYhtdJwPkohwNDkFgoD
	Iw8eikKNv2ni+vCZjVMd7o1mxIkTJfita29xtuoc/sUSFQKoA1z2W9GnDd/F0jAF
	VhCeF3QXwWyLk1Tq0hEEDPUjVgn0ICabLkUPW925ru0sTzMxzEAiSwRx9XyguMrB
	rlkhDDDlc0n+n+BeSDc+6PcawMvd3oU3WEWd4j+x1NfPD/zNyJKcBPIS0K3viGbO
	xzVS87oyjRLB32Ok5/Uovg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762066305; x=
	1762152705; bh=2MPoV+MTAdGoRJUdgFuhFNIxbSRUWNHncLFL41VMeVI=; b=Y
	q1tYrnM/DwhjUUX2Uo9uL+j37KHKS+O1XNKI86MNDTi3lrtKL+z2Q7ZNM0D12Kky
	Z9MWWfDvDW4tp2mh0qe49yeK/aDK+TMdRS11+yjUbPLJ8wFC5ZipmtWY2yxn2EvT
	45zx3nkPX6Mg5r3zOh5KbyKfN7dgmYNV1khbVzgW9y5xKJapFgudbiMocM7lAlMU
	2RudV4i+aFWOANPkpryTyuoffDUuTlWLMe7OzFzqFSZJQaTZpT/kheYYuMlDBgXb
	L+uT2mKPpw3sE8J/dHX9eUMQIXvz7EC/pFJyEGc8uyK5YoAVSRjt6b0/WBFoIwSa
	CHkRkH6hl94cAcaGqgTJQ==
X-ME-Sender: <xms:f_8GacToOqqDkX8FnORik7POSADPdu1c7Bd4chgW2UKC_9mH3Ia0Mw>
    <xme:f_8GacA3s_NZ8ZZXvjVuiCB4_fy89L1jut19wfcyG7cSM7mnKfZ3bdqwSYJ3LyxQM
    gvXyFKoSDS8Agt9KQ3bmlwEGA67B4In1Orb_zvzkci_tE6Lub1ZyeA>
X-ME-Received: <xmr:f_8GacEYqZeZRqwVuK44Nko6PYwld2ooYVoOM4cJnnwkSIB8RBRNc_PB4TL3oj3yj6ldhMUL8rPbS63Y94MQAupBPNJ2J-kOlV12vl5-yE2X53w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeegheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeflohhshhhu
    rgcumfhinhgrrhguuceolhhinhhugieskhhumhgsrgdruggvvheqnecuggftrfgrthhtvg
    hrnhepjeffueffheevgeffudekuefggeettdetvdegveeuhfetgffhgfeileetkeekieeu
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhinh
    hugieskhhumhgsrgdruggvvhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinh
    drtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgdruhhjsegsphdrrhgv
    nhgvshgrshdrtghomhdprhgtphhtthhopehovhhiughiuhdrphgrnhgrihhtrdhrsgesrh
    gvnhgvshgrshdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotges
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:f_8GaWBe2D1Np_ZackpGo2PL236JhFQlJ8TzRy_sCjnM8jNzsNFzEQ>
    <xmx:f_8GaUVDH0JOoFayYAmlkq-4CP0DmTIL00SVK72eFDvvt5SdAjGu-A>
    <xmx:f_8GaSoCqWkpn4s7rHzDUmZb2nLB_VMUBP09kUVNTQe1loM_rv21aw>
    <xmx:f_8GaYQDerOmRrn5qOhAvUu8tOdLNsgWuSDZq6XFx8Cz2zfytj9GNQ>
    <xmx:gf8GaRkKax8YkJaGdqcxuAxR4uZCblVa13OL7fwq5d1JDk0gtWMUPUf1>
Feedback-ID: if8114916:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 01:51:43 -0500 (EST)
Message-ID: <ac3e483d-6784-4acc-9fcc-b3bb605ab0c1@kumba.dev>
Date: Sun, 2 Nov 2025 01:51:19 -0500
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] rtc: ds1685: stop setting max_user_freq
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20251101-max_user_freq-v1-0-c9a274fd6883@bootlin.com>
 <20251101-max_user_freq-v1-2-c9a274fd6883@bootlin.com>
Content-Language: en-US
From: Joshua Kinard <linux@kumba.dev>
In-Reply-To: <20251101-max_user_freq-v1-2-c9a274fd6883@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2025 20:45, Alexandre Belloni wrote:
> max_user_freq has not been related to the hardware RTC since commit
> 6610e0893b8b ("RTC: Rework RTC code to use timerqueue for events"). Stop
> setting it from individual driver to avoid confusing new contributors.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>   drivers/rtc/rtc-ds1685.c   | 3 ---
>   include/linux/rtc/ds1685.h | 1 -
>   2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
> index 97423f1d0361..5fc8e36b1abf 100644
> --- a/drivers/rtc/rtc-ds1685.c
> +++ b/drivers/rtc/rtc-ds1685.c
> @@ -1268,9 +1268,6 @@ ds1685_rtc_probe(struct platform_device *pdev)
>   	rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
>   	rtc_dev->range_max = RTC_TIMESTAMP_END_2099;
>   
> -	/* Maximum periodic rate is 8192Hz (0.122070ms). */
> -	rtc_dev->max_user_freq = RTC_MAX_USER_FREQ;
> -
>   	/* See if the platform doesn't support UIE. */
>   	if (pdata->uie_unsupported)
>   		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc_dev->features);
> diff --git a/include/linux/rtc/ds1685.h b/include/linux/rtc/ds1685.h
> index 01da4582db6d..8ec0ebfaef04 100644
> --- a/include/linux/rtc/ds1685.h
> +++ b/include/linux/rtc/ds1685.h
> @@ -324,7 +324,6 @@ struct ds1685_rtc_platform_data {
>   #define RTC_SQW_2HZ		0x0f	/*  0    1   1   1   1  */
>   #define RTC_SQW_0HZ		0x00	/*  0    0   0   0   0  */
>   #define RTC_SQW_32768HZ		32768	/*  1    -   -   -   -  */
> -#define RTC_MAX_USER_FREQ	8192
>   
>   
>   /*
> 

Acked-by: Joshua Kinard <linux@kumba.dev>


