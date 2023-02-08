Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 448BC68F1E5
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Feb 2023 16:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjBHPXG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 8 Feb 2023 10:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjBHPXF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 8 Feb 2023 10:23:05 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886C243922
        for <linux-rtc@vger.kernel.org>; Wed,  8 Feb 2023 07:23:04 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id sa10so21637733ejc.9
        for <linux-rtc@vger.kernel.org>; Wed, 08 Feb 2023 07:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bMUk0/YknGV0FUEQlxokCIXTwLEkw3yvGRzYLDxYwaU=;
        b=DJ89by036xjN7BfAosB90Z3bWkNh0HsqjzrBVJfJIglX1YmCbjdbZ8oZ27Kh+o84oo
         NfVn17wG2vLQwo9aqvtyHzfGUEW/eY9j2V2DbN6+4RqWltYx3tjprykAIegQJvpIphd0
         ycjAPICfj0m7y4yqVZdn4RJWYfloM05ytr8tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMUk0/YknGV0FUEQlxokCIXTwLEkw3yvGRzYLDxYwaU=;
        b=1l2wYv/QOkdQgnpjORJll0/09FghK9VB6IY81/PehhT8YPtwKzAHFBKT32bRY6VKNS
         XbyQtxSsIBGA4Cjl6KktrLA/RlooLG++B+7JLWEEhqdWhZ3JHn8KOUDkihDUBUuu19Js
         Wcg6PPh4ainEsMZuKtj8b0mfIJCBvy3f0jU32YejAg0bpX6N1dDHA9wtFx5wmUiHtxf+
         aR58how8gP2qqQa2HEl9pZYbkqWNCX/tr2uUuiOPlALvxbtwXE+5yu5ikJw+ovOXDctR
         WbFneY8mVs4L9EoAMoATzk25FOLhb2fX014YPEUxKm5Cvyn1JowILLbG3TW+7pJwo8yR
         x8Qg==
X-Gm-Message-State: AO0yUKUI0PcA/xDAPWJB3M4x3xNsouWfth+84b0OsU15ORxujXFmVhjd
        L27ByOqGtV0V2wgFf+kp94ylvMrniyOFDIev
X-Google-Smtp-Source: AK7set9QR96GEEhyMo917lRX2JN+T/zHuUdEJIFFVGxCw9BII/m4oYbevoVPtmB4rGUUWP8IlrERgQ==
X-Received: by 2002:a17:906:af6a:b0:88a:7408:384c with SMTP id os10-20020a170906af6a00b0088a7408384cmr7855540ejb.47.1675869783086;
        Wed, 08 Feb 2023 07:23:03 -0800 (PST)
Received: from panicking (mob-37-180-45-5.net.vodafone.it. [37.180.45.5])
        by smtp.gmail.com with ESMTPSA id m5-20020a1709062b8500b00872c0bccab2sm8411525ejg.35.2023.02.08.07.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 07:23:02 -0800 (PST)
Date:   Wed, 8 Feb 2023 16:23:00 +0100
From:   Michael Trimarchi <michael@amarulasolutions.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Michael <michael@mipisi.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: Problem when function alarmtimer_suspend returns 0 if time delta
 is zero
Message-ID: <Y+O+VBSNywC7LKhn@panicking>
References: <S1728511AbfHaSEm/20190831180442Z+580@vger.kernel.org>
 <08fbdf25-faa1-aa13-4f13-d30acbf27dda@mipisi.de>
 <20190902074917.GA21922@piout.net>
 <alpine.DEB.2.21.1909021247250.3955@nanos.tec.linutronix.de>
 <4fc3a016-ec2f-a15e-5fd1-6794a001e2d9@mipisi.de>
 <alpine.DEB.2.21.1909040047210.1902@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1909040047210.1902@nanos.tec.linutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Thomas

On Wed, Sep 04, 2019 at 12:49:21AM +0200, Thomas Gleixner wrote:
> On Tue, 3 Sep 2019, Michael wrote:
> 
> > Thomas,
> > 
> > thank you very much for your patch. Unfortunately currently I can only test it
> > with a kernel 4.1.52 but i've tried to patch
> > your new logic into my older kernel version.
>

Is this patch valid on mainline too? because apply it was let rtc
working 100% of the time

Michael

> <formletter>
> 
>  https://people.kernel.org/tglx/notes-about-netiquette
> 
> </formletter>
> 
