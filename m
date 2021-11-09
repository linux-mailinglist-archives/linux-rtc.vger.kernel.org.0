Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4829E44ACD6
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Nov 2021 12:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhKILuN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 Nov 2021 06:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241871AbhKILuM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 Nov 2021 06:50:12 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475AAC061766
        for <linux-rtc@vger.kernel.org>; Tue,  9 Nov 2021 03:47:26 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id bk14so10230370oib.7
        for <linux-rtc@vger.kernel.org>; Tue, 09 Nov 2021 03:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pFIaOEBE3jLlzl6nBmZ3jg57oyX5JW9xJ2v9BAzzICM=;
        b=LeL9etCeX8uwNqkyylsOjPnNZMdwwusOGMOEeW3rU91ddwANV9F460ShhpFrXwEKUu
         AnHaSEFTF+I14vnJJv7Am22NNyAgQvtHjzrucgLjK4yF1Xhl0RUCdVpuDRLR/FH4qvsB
         u+X0jhFb5z3wC3pzI3A/BqEgfymLUkhwXwI98jrHX6B+TYqVlPaBTFJLgIYeDbsZD4Rv
         Gh9rZlnmXl+hEB1EG21CwcdRVKQ3UMJAa2p2pk+1gT18qu7dYcUFhmZbP1KbF1mfB2wl
         skyVmuNW5+Q7gWlJOR6DD8kMZWmgv3tqwcute5zFXB5ce1c1J0VngvOQOntQYMAj2SmF
         4njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pFIaOEBE3jLlzl6nBmZ3jg57oyX5JW9xJ2v9BAzzICM=;
        b=mYl7w6grHFJJt5qL6Ne5yu8C6avdMt0cBGi0l6EYejQb7UbhoiKWVRMgP7bGUItOa+
         nVYAxcqkozFNW52t9W2eVx/Lw1KYNiZuiJfx5xtVA/Hr17cCI3rhd+qZWzegNH9E1+ca
         t2Dgk3xTSQRoZp0+AsPhu10iAn578Z/luF4dyF2L3Wc2GgQdhohbrnoWdefALa+w2oAK
         3PKSNDnMcG3ZubTi4BTxuWZrR0Sv5uKe/EXQYWdIjPzOYJFqVFcfh2BhwM2HKzi3bBMu
         bSYfEChdTyYZiv06CGqguewXBYblc3G/1Zcx+tBYQ8G7vX98+ZoAFJAsqkpgD5dWgV1j
         +oMA==
X-Gm-Message-State: AOAM5332wjxtyiuUk6CBYjNc1Psmm00nlTcTJ681tef6BLxfUC3D7xOh
        MBWawK0Z1eZzuKj4iyBXKqudOSqsUh82CccflEHLlQ==
X-Google-Smtp-Source: ABdhPJwEOP6hTw/QdLuaZqo0gQ+u9f+SSIeTdJ5gnFmYLjdI5+WU5LUyOlx+SqVjELBxLZX8CpI6iiNsihQHXWFUkXg=
X-Received: by 2002:aca:120f:: with SMTP id 15mr4887619ois.132.1636458445642;
 Tue, 09 Nov 2021 03:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20211107225458.111068-1-alexandre.belloni@bootlin.com> <20211107225458.111068-6-alexandre.belloni@bootlin.com>
In-Reply-To: <20211107225458.111068-6-alexandre.belloni@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:47:14 +0100
Message-ID: <CACRpkdYyxhvVphR7b=b42qEUDGNM3jB_Zc6CjBR5ZK7PhDmVOw@mail.gmail.com>
Subject: Re: [PATCH 06/12] rtc: ab8500: let the core handle the alarm resolution
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Nov 7, 2021 at 11:55 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> Tell the RTC core UIE are not supported because the resolution of the alarm
> is a minute.
>
> Note that this is in fact also fixing how the resolution is reported as the
> previous test was simply ensuring the alarm was more than a minute in the
> future while the register has a minute resolution.
> This would be ok if the alarm was a countdown but ab8500_rtc_read_alarm
> suggests otherwise and the AB8500 datasheet states that the RTC
> documentation is not public.
>
> Finally, the comment is wrong and what makes the UIE emulation work is
> uie_unsupported being set.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

I trust you on this one!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
