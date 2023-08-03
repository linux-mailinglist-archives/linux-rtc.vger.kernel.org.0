Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF4676E690
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Aug 2023 13:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233764AbjHCLPl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Aug 2023 07:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234497AbjHCLPh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Aug 2023 07:15:37 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B7F1BE;
        Thu,  3 Aug 2023 04:15:30 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-ccc462deca6so899188276.0;
        Thu, 03 Aug 2023 04:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691061330; x=1691666130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XvrkmR/GsQ1HMr54PqMYkqS+TeUTTxRI2jjZ2dcD23k=;
        b=IvXAE9PwMCOx4lOEXxYjeJCC+Aes1HqoaXiTM+vKHIPLBzawNSbVZc39cPlGlpCU8z
         dMlhuP+G1oWareynzfU43+5EZByDJcY6rgyOPVvEi26TU93WiInRpUPLP3zcO2p1UGTI
         GcnC9qKWiF2vpVZvO2JTDFAeWiFYQZ5PS9wQv29tktS2X7X1LWtJeypVeHQg0dqrXwpz
         GFW8OZ+OBDqfFDddS6umW/ZcTMn6zmZjI8X/KuFc+PbTIsyB+NgYqfrTEJBrNL82VwUS
         f+xu3Fsr6u+F2XraijEfkzR50Lm0mG5Y9JbdwzaC4MyL4kW2dqAxE84bDZ/XWUTbSJl+
         QUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691061330; x=1691666130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvrkmR/GsQ1HMr54PqMYkqS+TeUTTxRI2jjZ2dcD23k=;
        b=kvVUTNNDdTkq3aYhGpZ/kTbpGTSBGdesD/uq7hcSv4zJnAVWuNaG1+RYdHbhb1jkoj
         H/q3lloGXXI0LHkmniynVoRaPcrEv8B62mhfeorsKmtuT8uiRqnFvyx++R9UPrv+qwM4
         yscfZzi6q4YA8LOEad0FF34MhWqryF6gFOOdCIpp0ykiyErRgCu0ctaIQKPlYH1/8NQU
         LAoJhtkodmY408kZuwsK3vBDW0s20iA5OX/9rCdkUNoUhV6+3HrGthCFYPExDNcou0hJ
         vdrQaIIauAZMr/OcjrV66GRKF9E3KiBLwlRGKRTf2eu/iWb7nEuSFsLG+l1Y2mZwflMh
         Nckg==
X-Gm-Message-State: ABy/qLZa3oQXiC2X44M33vRoza8RWHcG8gCrc6cxjqy0DF7Ly/YlWHsT
        I60Xe+xMRA1zSXjxzGw39cekGkHjGfzb0Fg2sz3QCyJPFX8=
X-Google-Smtp-Source: APBJJlFDLYuiAMlNHHU4rfxVa6ew/plKNYqwkDYP8uCnZ2HdgbEl7P5ytZq4DM5A9tDHYjBGL5RgAyKksJ1W8UQn/zQ=
X-Received: by 2002:a25:690a:0:b0:d14:b4bc:d574 with SMTP id
 e10-20020a25690a000000b00d14b4bcd574mr20030482ybc.34.1691061330082; Thu, 03
 Aug 2023 04:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <55b9c84b-9d21-444f-b91a-cf9316b65833@moroto.mountain> <20230801152231.bdf746e985c8c44209d28bf7@hugovil.com>
In-Reply-To: <20230801152231.bdf746e985c8c44209d28bf7@hugovil.com>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Thu, 3 Aug 2023 13:15:14 +0200
Message-ID: <CAH+2xPAr-N0VHYxepntk6k5ghiwK5ev6h2-pQq6Q_f1GLjJbpw@mail.gmail.com>
Subject: Re: [PATCH] rtc: pcf2127: fix error code in pcf2127_enable_ts()
To:     Hugo Villeneuve <hugo@hugovil.com>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Den tirs. 1. aug. 2023 kl. 22.14 skrev Hugo Villeneuve <hugo@hugovil.com>:
>
> On Mon, 31 Jul 2023 17:09:30 +0300
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> > This error path accidentally returns success.  Return -EINVAL instead.
> >
> > Fixes: 420cc9e850db ("rtc: pcf2127: add support for multiple TS functions")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > From static analysis.  Not tested.
> >
> >  drivers/rtc/rtc-pcf2127.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > index 78141bb06ab0..988cad171174 100644
> > --- a/drivers/rtc/rtc-pcf2127.c
> > +++ b/drivers/rtc/rtc-pcf2127.c
> > @@ -1060,7 +1060,7 @@ static int pcf2127_enable_ts(struct device *dev, int ts_id)
> >       if (pcf2127->cfg->ts[ts_id].gnd_detect_bit == 0) {
> >               dev_err(dev, "%s: tamper detection to GND configuration invalid\n",
> >                       __func__);
> > -             return ret;
> > +             return -EINVAL;
> >       }
> >
> >       /*
> > --
> > 2.39.2
>
> Reviewed-by: Hugo Villeneuve <hugo@hugovil.com>

Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>
