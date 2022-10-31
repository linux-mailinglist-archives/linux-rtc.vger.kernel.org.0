Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 659A9613B6D
	for <lists+linux-rtc@lfdr.de>; Mon, 31 Oct 2022 17:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbiJaQgx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 31 Oct 2022 12:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231806AbiJaQgw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 31 Oct 2022 12:36:52 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466AA11C2F
        for <linux-rtc@vger.kernel.org>; Mon, 31 Oct 2022 09:36:51 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id b11so10843891pjp.2
        for <linux-rtc@vger.kernel.org>; Mon, 31 Oct 2022 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ktu8OH92DZspQ/EalzrzH2xRK2hDUy12EpR7qlAoKb0=;
        b=cJOxA2b0uPiBCezL07Ov82tEB4jHsTf3Ta5PEIqG7TnX4XNfxyySy0wk6i+wDyySZj
         i2+/m2JEoZUui7IU/AN9q1CbDBYhtHU1Ep/oFUbIYkB1PITOZjwszPoHhCTTLN/xE6Lr
         FtMUFI5OTIUTPNNQ/FUTjCvTa88nV+YH7D03w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktu8OH92DZspQ/EalzrzH2xRK2hDUy12EpR7qlAoKb0=;
        b=59RsBea1gNKwuRpZ009vNYyNWmUZlZAFbZ6wX4Nqg72TujFEfNva4AVJmg7FJ0JzZt
         hmdIvcwTz3Ql6ktRoIGlQCFu4ZayKpgxfYnZVjh5b7uAuSg2cZ4DWhyjbo1wiUvnKnxD
         B5AK7JydfoEMcjgEBaibofWD5ciE6HQIH0biOBtSYWXGwxGXQkz8XjvcY1+oOSxF5Wzw
         VFI6uaoertmWQ2VFMPGFKgb4goHnMoJ9hz7Fo9OTmPam1DBYLxJRO833xsGtR/YcdRun
         YSYpbj6hP0Xw0/fRBpXw8G4OvRelcjyj7n72GMRecgbi7R2CN+z9aHxvpfw/wBkNg9ea
         lfgg==
X-Gm-Message-State: ACrzQf13oxkRgqs8FtxqaDuHQHxg+RA2bqOknqv/a42+z61GUOW2DSQC
        MbJbtvl5R5SqKcHgb7ul6oScYw==
X-Google-Smtp-Source: AMsMyM6TSgLhlriqWZHeTadke/nSbx3vqmxUQeI1Dl0qdWWkCayFHXAce3dvg+tYvHkGMJ3J6ekueg==
X-Received: by 2002:a17:903:234c:b0:187:28b2:85f6 with SMTP id c12-20020a170903234c00b0018728b285f6mr3796395plh.106.1667234210737;
        Mon, 31 Oct 2022 09:36:50 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cf9d:6561:637d:2194])
        by smtp.gmail.com with ESMTPSA id m3-20020a17090a3f8300b0020a7d076bfesm4443584pjc.2.2022.10.31.09.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 09:36:50 -0700 (PDT)
Date:   Mon, 31 Oct 2022 09:36:47 -0700
From:   Brian Norris <briannorris@chromium.org>
To:     Tzung-Bi Shih <tzungbi@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Benson Leung <bleung@chromium.org>, linux-rtc@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: cros-ec: Limit RTC alarm range if needed
Message-ID: <Y1/5nyplwrxSLg+M@google.com>
References: <20221029005400.2712577-1-linux@roeck-us.net>
 <Y19AdIntJZGnBh/y@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y19AdIntJZGnBh/y@google.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Oct 31, 2022 at 11:26:44AM +0800, Tzung-Bi Shih wrote:
> On Fri, Oct 28, 2022 at 05:54:00PM -0700, Guenter Roeck wrote:
> > Drop error messages in cros_ec_rtc_get() and cros_ec_rtc_set() since the
> > calling code also logs an error and to avoid spurious error messages if
> > setting the alarm ultimately succeeds.
> 
> It only retries for cros_ec_rtc_set().  cros_ec_rtc_get() doesn't emit
> spurious error messages.

All of cros_ec_rtc_get()'s callers were also logging the same message.
So it was redundant. I think the general strategy here was to log the
error(s) in callers (last point before we "exit" the driver), to have
the best chance at context-relevant error messages, or ignoring them
where proper.

It's already a bit dubious to log kernel messages at all in response to
normal sysfs operations. We probably want them in some cases, when
things are particularly unexpected, but it shouldn't be a regular
occurrence, and we certainly don't need *two* log lines for each error.

Technically, if one wants to be super-nitpicky about one purpose per
patch, then maybe a patch to trim the logging, and a patch to fix the
alarm range issues...
...but I think that would be a little silly, and perhaps even harmful.
They are related concerns that should be patched (and probably
backported) together.

Brian
