Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D24FB1F7776
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Jun 2020 13:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgFLLsg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Jun 2020 07:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgFLLsg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 12 Jun 2020 07:48:36 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D4DC08C5C1
        for <linux-rtc@vger.kernel.org>; Fri, 12 Jun 2020 04:48:35 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s1so10746347ljo.0
        for <linux-rtc@vger.kernel.org>; Fri, 12 Jun 2020 04:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/TjfYUNBP2cW26HkJvVfI0SpqRgYSTehKoOJVukkk8=;
        b=g4Bq9cbEzclMjz5WLywEQTTotOgWBL1TuZxvY8s8NTtX9NhHekjCAEGWRmnI7CJdel
         rL1llVEc0aF3HjR68ob4kb2AvbuLB84EloS9UKzeqgfrD/p8cVwtFcvE/y5MXtsStkiw
         p0qgalMfOoLXxrVyIuyBLGTLO/lg46Na7Z5DEj4cKMaRyB6lQJk4e0aJOuzuX1o+Kmu9
         tjRm6PTkX6pMBgkh8wFOWud3HTJKLivkARIDbXn+uu7Zc4kM+Om7x+oCVHxXhFzwBVAy
         2VBKOWHM83JfECFRy0bp0sCqp5kx/DiOD82tRFpKoI/kSZdZcrOaf90NCIFdn4snPyqC
         HOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/TjfYUNBP2cW26HkJvVfI0SpqRgYSTehKoOJVukkk8=;
        b=WIfOxxwuuNpjIOZzi6Hwu99xCHvYAW8JOf20IQ2a6Qt7o5FmtEH8O5fSAgKW5kS3AA
         TJ9J5QqPmt/OVzWXq3WMWV/BZjvSOx/MQv5FuEBURvA7A5dvnidZYzql9ZhTqLtGqc7c
         wJMJZDTORNJskeohip2Dm7pxELcYlx7zaa58996wf1EZagocSbqxema3bIYAwfka/gSk
         3m+ae2+p+1uQoDPSQE18xGOp8d/iVngxHItS6jD8DeG7Ma2U6xpZmfgPvehDJs0ONwV3
         331Jrd78HZ+2ZOtZpLOeO3tbwuEWdFlA6P1PkbcGv9hAWO92s8kdBOSGptZX6rQzgmo1
         Hhdg==
X-Gm-Message-State: AOAM531FzWYbefGY1Y/+eiZl/eef6AD5luuWC+2BPEuf01T3BNHIGDI5
        OHjePUJKjx+qS9K8JWtq3WjyVMsn0N2r1zSPj5XRXA==
X-Google-Smtp-Source: ABdhPJwnbvmf14hLKcPh9xhfT3LGK4uSWsLL6aeTp4pkg6ozrA3vKs6SipXaPF4bNCPSiMJ4KEG9WMcTk678Faudp38=
X-Received: by 2002:a05:651c:1130:: with SMTP id e16mr6750899ljo.10.1591962514142;
 Fri, 12 Jun 2020 04:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200530123222.361104-1-kevin+linux@km6g.us> <20200609221401.GA1492918@bogus>
 <CAE+UdorjD+2GORj3M6abgqTb8QnRZNFiyCX9PJAJc09xUBACqA@mail.gmail.com> <20200610151619.GW3720@piout.net>
In-Reply-To: <20200610151619.GW3720@piout.net>
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
Date:   Fri, 12 Jun 2020 07:48:22 -0400
Message-ID: <CAE+UdooznvJaJsMjrS+MeM6ysii8tR9fuZhjt44sMRF6VjYqPw@mail.gmail.com>
Subject: Re: [PATCH] rtc: abx80x: Add support for autocalibration filter capacitor
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        Rob Herring <robh@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Jun 10, 2020 at 11:16 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> When working with RTCs, there is one issue though: boolean properties
> are not working well because there is no way to express the 3 different
> conditions:
>  1/ the capacitor is present, set the register
>  2/ the capacitor is absent, clear the register
>  3/ the device tree didn't have this property until not and the register
>    may have been set or cleared using another mean, don't touch it.
>
> As your patch is written, it only handles 1 and 3 which is probably the
> safest option but then we will never have a way to clear it from the
> driver. I'd say that this is not an issue but it is also something we
> will never be able to change without breaking some setups.

I agree. I could implement this as an enumerated string option which
accepts 'yes' or 'no'. Those would cover cases 1 and 2, and the
absence of the property would be case 3. I looked through the bindings
that exist and didn't see any examples of properties configured this
way, but I think it would be understandable to users.
