Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1FE31E5D0D
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2020 12:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387838AbgE1KXC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 May 2020 06:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387740AbgE1KVx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 May 2020 06:21:53 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BBBBC05BD1E;
        Thu, 28 May 2020 03:21:42 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id x1so31454894ejd.8;
        Thu, 28 May 2020 03:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=U2BQABIsN/qZ72MOIKzLoMwJCMZeE1Anp7gIBpJ0H5M=;
        b=ZZT7998LLTuQxgzeX88wb9Z7L/SJ9scvbg3A5IpE5SrktemWkB0fTAPwKySx/5lmZt
         XFDhn560/jWQSWPJtlEsjV8ld9QPap8lBgnN2Ivq4AbmwBnYtyNu30gXMwFGJ0xMNtzM
         Ku5HF+/HlF2Q63OUjuxFwikkK8FVHGi9crrGAWyGibM5kTBfjf23JPUMKH63SDMfdSM5
         x1CvlsLvu0s52Mo+lvlVwwz7uq/5G6jIYlPdM3ENW1tdyFBZjXLpwlMKNGTvBEOtmA93
         6IJdXvHUNhBA8VCI9zkLsI70XSYlU1FNRUJ7b6e3Z4lR73Zgu8rjB5g4PN88lkBCH3qo
         lg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=U2BQABIsN/qZ72MOIKzLoMwJCMZeE1Anp7gIBpJ0H5M=;
        b=Uzbjj90qfdZ+Y6E3Xh/jbudDQrHHc8vd4OV/V85wyKBW/5/jTZhMjLIUzCWxUTyCcB
         QRi6nviQs3W+lmqEcL3k1L612G8H/9yO62lkyYIeYKJLtioliZceC/y3txv3YMaAYyv/
         XWMxDEds6gvB8Glv7/3upzHMqn+buLDGjzlfE7pXKNnbYXly3//VZrI8ZF59wOj+nsAV
         0NbGntOJBi/rqHSPSADdbW/bSCFIQaQaQc15ORpXOQvmUt6qKs6i2A3aU5ONq1tUnh+q
         P/0MkkHY32zgvdboPxvgjfqsp6sASgFZYuwSJaHiOtJYeOoth3uph2iEGqX+CXH5cMmk
         vEFg==
X-Gm-Message-State: AOAM533mitUMxC90QS2kI3cxafAU104tv85XQzfz5NopCg89W3iM4hQ9
        DfPV3YrCiRb5PQJ1S0WilROHr4WHK6uSA0xVlg2EBozn
X-Google-Smtp-Source: ABdhPJyJqNR0xdjogdnmD0Yo+4tawSd3wbiPkROxrgMatbEobKp5Pn7gpYH2oXVj9GINRBsA/sOsmsiGTv2KQLbSq+0=
X-Received: by 2002:a17:906:1c94:: with SMTP id g20mr2219697ejh.319.1590661301320;
 Thu, 28 May 2020 03:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <6eb98232-bc84-0854-243a-e54b91f2bda6@web.de>
In-Reply-To: <6eb98232-bc84-0854-243a-e54b91f2bda6@web.de>
From:   Chuhong Yuan <hslester96@gmail.com>
Date:   Thu, 28 May 2020 18:21:29 +0800
Message-ID: <CANhBUQ0_do+=MZsj0NKEfAAVeuWy8V+hvQuVBBB2o+u+H9s1qA@mail.gmail.com>
Subject: Re: [PATCH] rtc: rv3028: Add missed check for devm_regmap_init_i2c()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, May 28, 2020 at 5:17 PM Markus Elfring <Markus.Elfring@web.de> wrot=
e:
>
> > rv3028_probe() misses a check for devm_regmap_init_i2c().
>
> Such information is helpful.
>
>
> > Add the missed check
>
> Thanks for another completion of the exception handling.
>
>
> >                      to fix it.
>
> I suggest to replace this wording by the tag =E2=80=9CFixes=E2=80=9D for =
the commit message.
> How do you think about to take this possibility into account
> for any more patches?
>

I got it. I have added fixes tags in my newly sent patches.

Regards,
Chuhong

> Regards,
> Markus
