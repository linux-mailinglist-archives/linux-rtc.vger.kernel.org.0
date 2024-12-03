Return-Path: <linux-rtc+bounces-2661-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E09E1FE1
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 15:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A34ADB271A8
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 13:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3CB1EF0AE;
	Tue,  3 Dec 2024 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="u75sQhoN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C42192D98;
	Tue,  3 Dec 2024 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733233062; cv=none; b=iOrcfVghg/I3zkHZ3RC/f8EmEBtMcQbSn6MVeT1K+frR1P0N9e+v00lLh26+nEjqOMy/DprhFMgv4AOs25INw1ZYdhUbmD9YyzGL8CgSeIfdBoNYPDSYwO+us08f+YhjLktR9EJHcdO+O8wfCXSoRhUsaU3i2Mio7+MxBAB1va8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733233062; c=relaxed/simple;
	bh=GsCicvMScGn7z6L4S6M5h+/9mj2B4x/kGTcdM7apyVo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CCt2njcjwb3Z2ubV/WNmHUYN8RZYcQ7DN0MGk+Bc8wFgU3Mnh1b2eKhiAdCubvYUhHL6Ul7OO/MuojM/m1qK4w7IpzmJdhwx/9myHJUI4zb6B669o5/Bh45Bv4wnEPfqenHKQ1L3PHM7fTdSTrf2GicJsssoqKtnr4FYTD9ECqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=u75sQhoN; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6I/jTxWjwgLTjkEk8olI2grbbedbDAW6cOesFET5tGQ=; b=u75sQhoNYd14D/9cDtkKOIMuhp
	1CnXgAILC58nVqEpN/UEsvNz5PlQ19wLgMBkC98SjBox7vw+xumHZ+ZHDp7bhmwC7N/cvFF2snqgB
	SR96+t7wUEpGyYot+Fvve6FezzWXAzWqC4XnsxvwXdjTFWfmE1OA6q36b0LvacycZB6bOl3tDxz/p
	0A1LAbDxYPyrZ8yyd+fxcutG/Y/fTwXYe00JZsc/YB0Eo+IduoOlB7uo//+WDFWlPYMbP7M4Y5r5c
	oWk/MlxsQfr+zOf4wa2yKvedcvC7dPcp664P7GW7YTj/KGSStXSW2mZfR/qkEQqeWwORhqSN2sgU1
	yEWLd8cA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIT5p-0009sc-A6; Tue, 03 Dec 2024 14:37:33 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIT5o-000OZv-34;
	Tue, 03 Dec 2024 14:37:32 +0100
From: Esben Haabendal <esben@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  Patrice Chotard
 <patrice.chotard@foss.st.com>
Subject: Re: [PATCH 4/6] rtc: st-lpc: Fix initial enable_irq/disable_irq
 balance
In-Reply-To: <202412031325408acbe302@mail.local> (Alexandre Belloni's message
	of "Tue, 3 Dec 2024 14:25:40 +0100")
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
	<20241203-rtc-uie-irq-fixes-v1-4-01286ecd9f3f@geanix.com>
	<202412031325408acbe302@mail.local>
Date: Tue, 03 Dec 2024 14:37:32 +0100
Message-ID: <87h67klwf7.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)

Alexandre Belloni <alexandre.belloni@bootlin.com> writes:

> On 03/12/2024 11:45:34+0100, Esben Haabendal wrote:
>> Interrupts are automatically enabled when requested, so we need to
>> initialize irq_enabled accordingly to avoid causing an unbalanced enable
>> warning.
>> 
>> To: Patrice Chotard <patrice.chotard@foss.st.com>
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> ---
>>  drivers/rtc/rtc-st-lpc.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
>> index c6d4522411b312f94de2701ff4ff491e5323aa96..dbc2c23bca23f5de6de3fd4b39c9c67290bfd78d 100644
>> --- a/drivers/rtc/rtc-st-lpc.c
>> +++ b/drivers/rtc/rtc-st-lpc.c
>> @@ -218,6 +218,7 @@ static int st_rtc_probe(struct platform_device *pdev)
>>  		return -EINVAL;
>>  	}
>>  
>> +	rtc->irq_enabled = true;
>>  	ret = devm_request_irq(&pdev->dev, rtc->irq, st_rtc_handler,
>>  			       IRQF_NO_AUTOEN, pdev->name, rtc);
>
> Seeing the IRQF_NO_AUTOEN here, I guess the patch is not correct.

I guess you are right :)
Sorry about that. I only have HW available for testing the rtc-isl12022
driver here.

This patch should be dropped.

>
>>  	if (ret) {
>> 
>> -- 
>> 2.47.1
>> 

