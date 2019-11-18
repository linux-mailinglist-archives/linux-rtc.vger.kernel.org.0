Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24E68100723
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2019 15:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfKROO7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Nov 2019 09:14:59 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43056 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbfKROO7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Nov 2019 09:14:59 -0500
Received: by mail-oi1-f193.google.com with SMTP id l20so15389770oie.10;
        Mon, 18 Nov 2019 06:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BQnUfuqyZN25lSU7+xutpRj8M5iGXjHoH4VRmIJgroU=;
        b=H1CvtY7+dMRgKdgSLcBFmSHsRhZNv3Mp80NseIGqZp80oVzjiMmY9njitJyaQXCb0M
         8jYdPTcP5KGzgTz2ARYrtIvm8pXZTOOO1/J2NgqtSYlBOAgDr+z+t1iA/KpD8kyt8l3y
         DNzng3/xnRY8nBnQZXptq0SWgYR9dxYg+XtpZ0DpatjR2+2w0MQUuIEVd1ZxO+VPRpbl
         81C4TCnznWFrgcA773VJduU5yF/QKjWRCgCDS6dpIwVBYETKPLrGJEmo8tZDRMgRB3l/
         MsezDH9neSLKANR01Z+axJAA6VfBgWEMVvsm7F6wYsfmomQQIjYOiXtPYQikEXWGKHiL
         v2OA==
X-Gm-Message-State: APjAAAUrkLrDVmTKWNpzHxxb6L38LHFmYQomF1PhyrWpwQ7Zv+IsItAM
        IVzXgPI7YgapEZoR6hTO4uigR946ZW4dLHNi5E2MaQ==
X-Google-Smtp-Source: APXvYqwJXLSlZO+FcHO5h7hvACrTneVR0Z2CGZyfZL22ivPJtdrsGHDK44JE5R8zlKc/nYzv4SOh1KHA/Os1bxw86NU=
X-Received: by 2002:aca:fc92:: with SMTP id a140mr19637268oii.153.1574086497141;
 Mon, 18 Nov 2019 06:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20191116110548.8562-1-jongk@linux-m68k.org>
In-Reply-To: <20191116110548.8562-1-jongk@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Nov 2019 15:14:46 +0100
Message-ID: <CAMuHMdXmEJ7ssmZ5rmc=cWwM6vhaJgVQrLz+mJ+PKBiqKGifOA@mail.gmail.com>
Subject: Re: [PATCH] rtc: msm6242: Fix reading of 10-hour digit
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

On Sat, Nov 16, 2019 at 12:06 PM Kars de Jong <jongk@linux-m68k.org> wrote:
> The driver was reading the wrong register as the 10-hour digit due to
> a misplaced ')'. It was in fact reading the 1-second digit register due
> to this bug.
>
> Also remove the use of a magic number for the hour mask and use the define
> for it which was already present.
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
