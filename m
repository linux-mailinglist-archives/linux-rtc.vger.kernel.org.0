Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 019B14EF86B
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Apr 2022 18:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349736AbiDAQz2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 1 Apr 2022 12:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350379AbiDAQyx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 1 Apr 2022 12:54:53 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8006386
        for <linux-rtc@vger.kernel.org>; Fri,  1 Apr 2022 09:50:50 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id b43so4662077ljr.10
        for <linux-rtc@vger.kernel.org>; Fri, 01 Apr 2022 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=luJj4KxFKmBTkLspMbSvyuPZv8Dkm0lFcSWy4HmQZis=;
        b=Peuvx5N4W5SP8SZZ1FljaHqobq5N2Y8E5+jr3IR/SLI0XgCsiqJT4lNfJVJYQ36xfr
         1PkzzDVLmLoemm1XKNLmG1O2R0Q+iskRlMlTGQFh1Nfu3laGnl7iXDzye9itDnrRyzXp
         nyBb8dfODDODYXQJZ83eRiZmuVegiQPrbGUL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=luJj4KxFKmBTkLspMbSvyuPZv8Dkm0lFcSWy4HmQZis=;
        b=IBtPxRhtA+5M8r+9uYrd/JOMaEKetrqrX52fUbjODNcEUrShwv2N+xAIcqW1euh0Kj
         36OoTAwJABDPMfbB2E0mBmUxwqJEKdqIY/6r8oCNuWdXqkUXs16yxg0wc/cSs9P8iCAv
         0gkEyNyL/C7uGmF8Eb1If/jVycauSSGw+uwhzpPkVEFXFDR6xo2FiNnHXxkvGUqz4wYR
         5R0wG8/Wgvbs1Tjay4Y5oeXaD4S4xOhYA6yKZsI5zcHS/S89WFoM73OeLtON5BvbpIld
         5FAOJtjZXA0xI/nSOuE/dSxX+gVJzbGjkBDh5ObIaivRT5OihcXvNeqy1FPfvkKrc1+p
         ZhUA==
X-Gm-Message-State: AOAM532cklTypqmYMbLcHN6yI4apivnlfah3uD+qhg0C26ycX/bypcn4
        eQjGh6rAsCPAtE9FLiC4G73L7j8JOyXxV2PZtIs=
X-Google-Smtp-Source: ABdhPJzg7fd9BwG1J0tzaXiu8cMWUIV4AD26SsDmmm2YzFbvi6BHKCfmnpksJe2VSRC7pBJPYEDjcQ==
X-Received: by 2002:a2e:1546:0:b0:24a:c194:ba39 with SMTP id 6-20020a2e1546000000b0024ac194ba39mr13768423ljv.65.1648831847903;
        Fri, 01 Apr 2022 09:50:47 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id l5-20020a056512110500b0044a1061f722sm282852lfg.200.2022.04.01.09.50.46
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 09:50:47 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id t25so5963906lfg.7
        for <linux-rtc@vger.kernel.org>; Fri, 01 Apr 2022 09:50:46 -0700 (PDT)
X-Received: by 2002:a05:6512:3055:b0:44a:3914:6603 with SMTP id
 b21-20020a056512305500b0044a39146603mr14433392lfb.435.1648831846722; Fri, 01
 Apr 2022 09:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <YkYpfK5ubwafd+Rw@mail.local>
In-Reply-To: <YkYpfK5ubwafd+Rw@mail.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 1 Apr 2022 09:50:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjuUZWMeUaTGtfivNQYeuqsQb2C4HnbbPLe+qFXU5Y70Q@mail.gmail.com>
Message-ID: <CAHk-=wjuUZWMeUaTGtfivNQYeuqsQb2C4HnbbPLe+qFXU5Y70Q@mail.gmail.com>
Subject: Re: [GIT PULL] RTC for 5.18
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Mar 31, 2022 at 3:21 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Here is the RTC subsystem pull request for 5.18. The bulk of the patches
> are about replacing the uie_unsupported struct rtc_device member by a
> feature bit.

Hmm.

I've pulled this, but I don't see the point of the ALARM_RES_2S bit.

In particular, I don't see it used anywhere, and the two drivers that
now set it clear both the UPDATE_INTERRUPT and ALARM features.

So what's the point of that feature bit?

                Linus
