Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5526C2E3F
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Mar 2023 10:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbjCUJwi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 21 Mar 2023 05:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjCUJwg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 21 Mar 2023 05:52:36 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D8F33478
        for <linux-rtc@vger.kernel.org>; Tue, 21 Mar 2023 02:52:33 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id q189so8194286pga.9
        for <linux-rtc@vger.kernel.org>; Tue, 21 Mar 2023 02:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679392352;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3kX+a3qX70gDW/sRmJECpI+SbkCmpJ7AHS+lpfkXrc=;
        b=MwZfTXpLvQD/0H2VRFADWwvrOgGNjNRSUsGK/xJzzEwaWqDK25VFlf9iOR0/JG4esq
         lv3Xgd8Mtri+UWS4zzCljcizT7gkCEzbPK/Oi7BqUzSngbZ1yiQfl31fxM/xPo8jGx1J
         valLYDqhnXHH4OrAlj+X8pZTlYJRSSKoxUfnXPz8ARrRpmoik6JRSDHKGZjrmUl0e43E
         YjpP0PZpEjm7lNj1iqRaSjeujZvPD3kTPWqurYgYqMnEZDbGcpkXqGt7EhkAtPZF9TON
         h/JKnlkka6BtEYgpXOjpeg2OsaheJZ4QDxL7NwTbTFh6Si0AfYevAAYSStVKwGIpxgHx
         tnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679392353;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3kX+a3qX70gDW/sRmJECpI+SbkCmpJ7AHS+lpfkXrc=;
        b=i1/ihcwa4vd+jDiApZXNkX3/t3BIaNb7kt2z5ks2CXIMIE91iqtpMc9BoU8UCZMska
         5ShqJApAaY66UGGObAvB0Nh+r/dqX/F5GDAZi/vm6maPIg/QfIPIJoEdrJW2VvBVsvgc
         PPPiGWja0VbLLVZ30YjEY+amSEqaOBty9QhHDqZKdZDUG+BxWgkq4cIyMMTOydatsbmI
         rSIOCREPvl4KPZl9Il3r61VaAVX+LT7V5Cdu+oQYEnYElw0IgOhCk8YJ7NbmCNHEiAme
         qakBIby14jjFBkZ7uOrG/CbvwkVN0PG9781OvcqUJeN9XXI5kFnIW9P5F7aKeF7eaXsX
         14JQ==
X-Gm-Message-State: AO0yUKWEP7YTWtm5KkD4SIyctWDzj6Jaj5BYgvmeFmypGCr//LooSjyZ
        Qan1u1ybatTrvJTnXDPvV52e4A==
X-Google-Smtp-Source: AK7set8l8FeYzQFjltUm3v4e/D0eeBLpFn2IDwYmXFiw33WAeQ3He5HzXT9vccYmxhfHduptUCglAg==
X-Received: by 2002:aa7:98db:0:b0:624:9205:977d with SMTP id e27-20020aa798db000000b006249205977dmr1464992pfm.27.1679392352621;
        Tue, 21 Mar 2023 02:52:32 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id b5-20020aa78705000000b005a852450b14sm7801451pfo.183.2023.03.21.02.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 02:52:32 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-rtc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 RFC] rtc: meson-vrtc: Use ktime_get_real_ts64() to
 get the current time
In-Reply-To: <20230320212142.2355062-1-martin.blumenstingl@googlemail.com>
References: <20230320212142.2355062-1-martin.blumenstingl@googlemail.com>
Date:   Tue, 21 Mar 2023 02:52:31 -0700
Message-ID: <7hbkkmwhwg.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> The VRTC alarm register can be programmed with an amount of seconds
> after which the SoC will be woken up by the VRTC timer again. We are
> already converting the alarm time from meson_vrtc_set_alarm() to
> "seconds since 1970". This means we also need to use "seconds since
> 1970" for the current time.
>
> This fixes a problem where setting the alarm to one minute in the future
> results in the firmware (which handles wakeup) to output (on the serial
> console) that the system will be woken up in billions of seconds.
> ktime_get_raw_ts64() returns the time since boot, not since 1970. Switch
> to ktime_get_real_ts64() to fix the calculation of the alarm time and to
> make the SoC wake up at the specified date/time. Also the firmware
> (which manages suspend) now prints either 59 or 60 seconds until wakeup
> (depending on how long it takes for the system to enter suspend).
>
> Fixes: 6ef35398e827 ("rtc: Add Amlogic Virtual Wake RTC")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
