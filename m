Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8587100738
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2019 15:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbfKROT7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Nov 2019 09:19:59 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40457 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbfKROT7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Nov 2019 09:19:59 -0500
Received: by mail-oi1-f193.google.com with SMTP id d22so8479467oic.7;
        Mon, 18 Nov 2019 06:19:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LlbnYe+LYNl3bzTxxtCJWfnFvfltP+wo9WgZRAXweTU=;
        b=uXx/gcPpWxfGdjOTpd2TZvBPmVJKN3iKQX72vyb4Vpkss6UnYHPBfNPSQpCae2kF/1
         d6jPwmlI0hdKMBxqDsoAO6bzUi/vwZD7W1+gcEPOodBb9keL1cRICkTRWkGDNid2BBhZ
         ogVYrEcRHCqQ8OG5tpbhmwL2Mr/4mgTGtm2ZAR+ks354hFxTQtK7zmku7pXvw0frVt+c
         NWB9bs0+Tix04h8WuQ0P8FUqN+/WxThfHHUxw3NCOFNoJfSg23/xqjdMCojQu3XxSKf8
         S1G5hilFeB5FgLSpPnUlSrKheLf1JB5f97ID0bjcDxJvsiNEGjhKzbf3dUrFppjOmaEs
         u+AQ==
X-Gm-Message-State: APjAAAVVaEMgs09kVaYSwMJeNOX7SOGSb9oa5/lgU6ifg4OFRMbny37g
        oS9oMpo06LyBzaKy0rv8qjkDkXfPlsztoNSUFEI=
X-Google-Smtp-Source: APXvYqxWrKFZfkPOFssPIaeZK6fA30J1T3kw2M89/vEr8ng4ymwppDMf8+PVF9XCspw9ydA6TXMWFGnVqYySlYlLxf4=
X-Received: by 2002:aca:fc92:: with SMTP id a140mr19658524oii.153.1574086797989;
 Mon, 18 Nov 2019 06:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20191116114620.9193-1-jongk@linux-m68k.org>
In-Reply-To: <20191116114620.9193-1-jongk@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Nov 2019 15:19:47 +0100
Message-ID: <CAMuHMdUKJQSCe3mnGEnA+4Chrkk4SYM_VUpBtMFB0TqyadgOPA@mail.gmail.com>
Subject: Re: [PATCH] rtc: msm6242: Remove unneeded msm6242_set()/msm6242_clear()
 functions
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, Nov 16, 2019 at 12:46 PM Kars de Jong <jongk@linux-m68k.org> wrote:
> The msm6242_set()/msm6242_clear() functions are used when writing to Control
> Register D to set or clear the HOLD bit when reading the current time from
> the RTC.
>
> Doing this with a read-modify-write cycle will potentially clear an
> interrupt condition which occurs between the read and the write.
>
> The datasheet states the following about this:
>
>   When writing the HOLD or 30 second adjust bits of register D, it is
>   necessary to write the IRQ FLAG bit to a "1".
>
> Since the only other bits in the register are the 30 second adjust bit
> (which is not used) and the BUSY bit (which is read-only), the
> read-modify-write cycle can be replaced by a simple write with the IRQ FLAG
> bit set to 1 and the other bits (except HOLD) set to 0.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Tested-by: Kars de Jong <jongk@linux-m68k.org>
> Signed-off-by: Kars de Jong <jongk@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
