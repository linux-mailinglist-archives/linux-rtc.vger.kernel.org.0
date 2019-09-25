Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 943F6BE6A7
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Sep 2019 22:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388477AbfIYUvQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 25 Sep 2019 16:51:16 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39721 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388453AbfIYUvQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 25 Sep 2019 16:51:16 -0400
Received: by mail-lf1-f66.google.com with SMTP id 72so12666lfh.6
        for <linux-rtc@vger.kernel.org>; Wed, 25 Sep 2019 13:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fwxqGOJ4EK6HWwfzrt6IbqWGZET3zrS4nF5lIFmhKAQ=;
        b=HnOQjAxzxL/iJzgJXaCg8DLlJ7/U1bQzB2lHrCLH5blJi062W+/tBvhocCWxwQVLsG
         ZdNqs+k7YEQBDqFIPZmRn8Ket7KapoV3xCDu6OtwHCiotUTgZBgy39vuq/TFo6DsxHwT
         w6dakydXCqPgTAGvQ8t4fyhq30lgeDC8VTFuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fwxqGOJ4EK6HWwfzrt6IbqWGZET3zrS4nF5lIFmhKAQ=;
        b=cxNSSoUSj7XLcxJ0lzar+vA91ZDsHvzOUb958MQqV/b5J+G9gzgfEML8ol4MkYGBuA
         jmeyT2cA57UnlqnHhGlyNUBv2qFigmVOdr8QpTh5PfOb1xhanUktoIgHm3HNcjuseUDC
         Ym3T3ciolj+Ns985xB4SAAFY/+m8Q90kcYriDlXembVaYzybfTdQ58N+XsKfWQR9VWlL
         yRyVtdUS3XDZV5yJ1eVRfpk49T215FGYPukxGwKECECpw1F9AEwkCiJywpI2ArTkY4wF
         hE6z+ubKvjbFGciFf7L/s1xmmtegUX/eH1zBeB1LGbfkUZ5whZtKPh7tXOBKoio2Nl4x
         BGJg==
X-Gm-Message-State: APjAAAWpW++iCz5df4Wpg7GkZHdJKTOcvHViwsmWrY+Asrt/gXzJ61lI
        Vnl7ryu6snmKabZvm5t35ACY7xVdU2s=
X-Google-Smtp-Source: APXvYqylpR+twVpMjutrR+yL8EoAyppNJBw9RthDX2oRK72ph5aBR6occe85f9vEmRxjJb571UQx7A==
X-Received: by 2002:a19:488f:: with SMTP id v137mr13866lfa.26.1569444674245;
        Wed, 25 Sep 2019 13:51:14 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id j17sm25932lfb.11.2019.09.25.13.51.13
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2019 13:51:13 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id j19so7147746lja.1
        for <linux-rtc@vger.kernel.org>; Wed, 25 Sep 2019 13:51:13 -0700 (PDT)
X-Received: by 2002:a2e:2c02:: with SMTP id s2mr183696ljs.156.1569444672670;
 Wed, 25 Sep 2019 13:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190925203209.79941-1-ncrews@chromium.org>
In-Reply-To: <20190925203209.79941-1-ncrews@chromium.org>
From:   Dmitry Torokhov <dtor@chromium.org>
Date:   Wed, 25 Sep 2019 13:51:01 -0700
X-Gmail-Original-Message-ID: <CAE_wzQ9ohsoeGuk-gJ+ZtP4J7yCAB5b2JcO1HbHDZUj2PaQvyA@mail.gmail.com>
Message-ID: <CAE_wzQ9ohsoeGuk-gJ+ZtP4J7yCAB5b2JcO1HbHDZUj2PaQvyA@mail.gmail.com>
Subject: Re: [PATCH v3] rtc: wilco-ec: Handle reading invalid times
To:     Nick Crews <ncrews@chromium.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, enric.balletbo@collabora.com,
        Benson Leung <bleung@chromium.org>, dlaurie@chromium.org,
        Daniel Kurtz <djkurtz@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Sep 25, 2019 at 1:32 PM Nick Crews <ncrews@chromium.org> wrote:
>
> If the RTC HW returns an invalid time, the rtc_year_days()
> call would crash. This patch adds error logging in this
> situation, and removes the tm_yday and tm_wday calculations.
> These fields should not be relied upon by userspace
> according to man rtc, and thus we don't need to calculate
> them.
>
> Signed-off-by: Nick Crews <ncrews@chromium.org>

Reviewed-by: Dmitry Torokhov <dtor@chromium.org>

> ---
>  drivers/rtc/rtc-wilco-ec.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/rtc/rtc-wilco-ec.c b/drivers/rtc/rtc-wilco-ec.c
> index 8ad4c4e6d557..53da355d996a 100644
> --- a/drivers/rtc/rtc-wilco-ec.c
> +++ b/drivers/rtc/rtc-wilco-ec.c
> @@ -110,10 +110,15 @@ static int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
>         tm->tm_mday     = rtc.day;
>         tm->tm_mon      = rtc.month - 1;
>         tm->tm_year     = rtc.year + (rtc.century * 100) - 1900;
> -       tm->tm_yday     = rtc_year_days(tm->tm_mday, tm->tm_mon, tm->tm_year);
> -
> -       /* Don't compute day of week, we don't need it. */
> -       tm->tm_wday = -1;
> +       /* Ignore other tm fields, man rtc says userspace shouldn't use them. */
> +
> +       if (rtc_valid_tm(tm)) {
> +               dev_err(dev,
> +                        "Time from RTC is invalid: second=%u, minute=%u, hour=%u, day=%u, month=%u, year=%u, century=%u",
> +                        rtc.second, rtc.minute, rtc.hour, rtc.day, rtc.month,
> +                        rtc.year, rtc.century);
> +               return -EIO;
> +       }
>
>         return 0;
>  }
> --
> 2.21.0
>

Thanks.

-- 
Dmitry
