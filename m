Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7061F778C
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Jun 2020 13:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgFLL4H (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Jun 2020 07:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgFLL4G (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 12 Jun 2020 07:56:06 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E6EC08C5C1
        for <linux-rtc@vger.kernel.org>; Fri, 12 Jun 2020 04:56:06 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id i27so10702240ljb.12
        for <linux-rtc@vger.kernel.org>; Fri, 12 Jun 2020 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ucnIxwElOKlpVukLSQPIFDo0ylODSRdbNjg1DaOWm74=;
        b=LqGV1WND1alqrq1ai17PDQE5jJkgjT1U2yfSH6Ba708O8Dp7e8nYt2DEkVlOUUyPBt
         in1gwcYLKsDkpzsA60x8mKwHz21Qa/CjRJK+puu80S38jRcHDRnTV6dDbs+4mfIn4IzU
         NP6HG/A/A+EZxW0dO4379SiZpFOaLJicNSu0i0G4ATAb+AxByfQA4MSUCcNlxiX/Ttlt
         agl9iVM7336MU0ZaZUG8Xoooz+UzaRvpnjmvMJYcd7NLU0cxdLDrP3DYAvyAzF872/tD
         VdZ5Q4ANArCYY/txhj428HR4p6Eq+2LnH5IQezS/Y+p0E/K5od/YkXzLCCHLhE/b/btH
         VDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ucnIxwElOKlpVukLSQPIFDo0ylODSRdbNjg1DaOWm74=;
        b=FzQZZET3Vx2Uh9pts542nSx3JTWItiuy5MWpFo79QB+ELtTvm79wn7/KY623lSuzr6
         3YwHmBIiIvXGXaE4vl4PBxMjlcecAIrnLkqUzbpqv7jaiJReV0njF8dBAEzear4BzaO+
         xPh9Ss97E4D+9/2ucN11+kkUSFbRVyjQwZoBQ99KvU9UYbnaMQHEOAydZvzQHJx6vbC0
         YX7N0rmWX1ZDQRFm7cZA+yusXDENTvkJUMyPcKQijCiJuu3QygNAem3NvFYfPAx89dfi
         5Xj1zlXkmgV/ri9h4pnZf4UN9Q5QRjUtRbeBMXEz+P6ukntUdehNOUeixQfTR0ThRnVU
         DiJQ==
X-Gm-Message-State: AOAM533+7cJ31/hy8RNi8KikQGfWK3aabRzwsLFqUFeBl3X1NfD/tAb3
        Kh78WAxQldYgKLVJMUXGquhekY1bz5l3M7MO1ktf6Q==
X-Google-Smtp-Source: ABdhPJyFsVBr1HXnoDkX8Krow6XIyHCSYcqeve261bHok+e0Acz6kpApYjthrCaciHsUA76EoEDGOplnxYuumWszqMY=
X-Received: by 2002:a2e:a367:: with SMTP id i7mr7220605ljn.5.1591962964460;
 Fri, 12 Jun 2020 04:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200530124900.363399-1-kevin+linux@km6g.us> <20200530124900.363399-2-kevin+linux@km6g.us>
 <20200610152204.GX3720@piout.net>
In-Reply-To: <20200610152204.GX3720@piout.net>
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
Date:   Fri, 12 Jun 2020 07:55:53 -0400
Message-ID: <CAE+UdoqR1iPaYxT4aMCNkq0z8duy6abJcuojDz=wKCe7ZMtD5Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] rtc: abx80x: Add support for autocalibration filter capacitor
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Jun 10, 2020 at 11:22 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> I'd like to avoid having more error messages in the driver (and whole
> subsystem). Can you move the ABX8XX_REG_CFG_KEY setting earlier in
> abx80x_probe so you don't have to do it here and avoid duplication the
> error message?
>

Based on my reading of the app manual this won't work properly, as
setting the configuration key only allows writing to one register, and
then the key is reset. It has to be set to allow enabling the trickle
charger, and also to allow enabling the autocalibration filter
capacitor.

> The RTC can still work if this fails and the rror is transient, maybe
> just warn and continue. It will be set on the next probe.

Will fix in the next version of the patch.

Thanks for the review!
