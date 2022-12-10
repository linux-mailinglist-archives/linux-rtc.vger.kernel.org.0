Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62E43648D14
	for <lists+linux-rtc@lfdr.de>; Sat, 10 Dec 2022 05:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiLJEOF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Dec 2022 23:14:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbiLJEN7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Dec 2022 23:13:59 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2150C31DD9
        for <linux-rtc@vger.kernel.org>; Fri,  9 Dec 2022 20:13:56 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-40b40ff39f1so39044677b3.10
        for <linux-rtc@vger.kernel.org>; Fri, 09 Dec 2022 20:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ulh9++McEWHTOB6P5Ka9efyv+3TP8QPl365askkEGq0=;
        b=mvrQxKIdQOElepQpJg4WS4ziBVtlbOrqfbO4vOBulo9R1mBEsanZDv0fE32SVgrfkS
         2rE22wEBnTwI/hCNIj9UF3eIEZ648J4344ps9vRQYcO6Nv01JmEibNn1PJ8gRH4ZBYYe
         rVX4sVNuPaqB4S9Pb+DDF1aahut0DIf9+pcbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ulh9++McEWHTOB6P5Ka9efyv+3TP8QPl365askkEGq0=;
        b=JrVTZsRg+zWOLnQgitxViFM//sxOeSDIvO8WN1dd2R/YLBmgb/lXVzacrC/I2p9qhd
         CxHzAVlaNA9RwgmWHvZxjDM5jX9huBB7PuXvGH/RuH8QM/b7OFjWeqTmwuYk/dpGifb1
         iOOxFfNJ0EICAIUQRsRlBbgFt3qdx8aAK+6sBH8Ue2dts3g5IZE45DVxcJByUIhdF8cy
         zQn5eX7UQCoEDBuBzJBL7Cy8KzNIcLEydcEJI9qOBpGPvM/R8L7o+yN5hJGHIQ5SHhm+
         6aUqmd6ZfAbDIqSw28OP84Vguura6dnrljeLw/l2c8HUWPK5sG3Z+bxtGmc8Bt5jiGzk
         uYAw==
X-Gm-Message-State: ANoB5plly+gbl0/MxXzADwQxTdKJOosSI+JBENzDDXediOy12B9ErRBN
        ZzxvJzHs7DaMc2VBOG2VoE5B8DvLVEsVa9Np1ly11w==
X-Google-Smtp-Source: AA0mqf7dx5jjunaFJZjtrPR2XLjbxLbkIeL3qmdNqILQwcA/YZNLbCMwbWD2LXY2kj/nq4/AC3BtcFd5bvgudEYX2/E=
X-Received: by 2002:a0d:d988:0:b0:3eb:447b:6840 with SMTP id
 b130-20020a0dd988000000b003eb447b6840mr17744763ywe.307.1670645636141; Fri, 09
 Dec 2022 20:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20221202184525.gonna.423-kees@kernel.org>
In-Reply-To: <20221202184525.gonna.423-kees@kernel.org>
From:   Daniel Palmer <daniel@thingy.jp>
Date:   Sat, 10 Dec 2022 13:13:45 +0900
Message-ID: <CAFr9PXngqDMYNOsNSLNEq=sRY0JDhAn5H5vuMVZD2o1=W1iU_Q@mail.gmail.com>
Subject: Re: [PATCH v2] rtc: msc313: Fix function prototype mismatch in msc313_rtc_probe()
To:     Kees Cook <keescook@chromium.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kernel test robot <lkp@intel.com>,
        Romain Perier <romain.perier@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Kees,

On Sat, 3 Dec 2022 at 03:45, Kees Cook <keescook@chromium.org> wrote:
> msc313_rtc_probe() was passing clk_disable_unprepare() directly, which
> did not have matching prototypes for devm_add_action_or_reset()'s
> callback argument. Refactor to use devm_clk_get_enabled() instead.

I didn't know devm_clk_get_enabled() existed. Learned something new. :)
Really nice that it fixes an issue and gets rid of a bunch of lines.

Anyhow, the change looks good to me, I build, boot and "does RTC still
work?" tested this so:

Reviewed-by: Daniel Palmer <daniel@thingy.jp>
Tested-by: Daniel Palmer <daniel@thingy.jp>

Cheers,

Daniel
