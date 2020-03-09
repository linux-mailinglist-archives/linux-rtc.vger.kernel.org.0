Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB2F417DC93
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Mar 2020 10:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgCIJjY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Mar 2020 05:39:24 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37449 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgCIJjX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Mar 2020 05:39:23 -0400
Received: by mail-lj1-f194.google.com with SMTP id d12so9178650lji.4
        for <linux-rtc@vger.kernel.org>; Mon, 09 Mar 2020 02:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GWafhgkHqGjhRe8y+m1pE0quFmlowBtOnAE/oPWGyN0=;
        b=vXkFRFdzlpOZtT+31ydgd9FX6Z1Zvo7ZtEaYUUUUW+uBV0RVnItMZc3YcFbcE7StgI
         vFAu7B5k5ORVKbJJlmV5EaSIhBSm06bToQPWxW2sw0hcVM+qy6K+yhMcZaQzIacJvJnk
         me07kNBcAGV55Bm1xfEIxflpbzWiBrTxe/u04FpXKoHPfK+iddC/bwDnFI2tr0SQIOyd
         iElasMAdPOJOJjbiD8Df9etU+Xl/hIVTSSAN4OFehXJBCj5AukvJdc+mEHgduzN6ckSU
         pA9oabtckEopSKnlebbTUOLNLAse71uhJXUJks5a8jE7XQC1qt36yei5GNrrB10bz5C7
         UIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GWafhgkHqGjhRe8y+m1pE0quFmlowBtOnAE/oPWGyN0=;
        b=siGbdCYC5tSKcCGC5t7vKeJ73ycOFiQUUDb+wOnosV6PvyBlgzD39523OI+djKedPo
         YQPgvEg1mCuQM/SGUt0jnrSxYJciipbERdQiLm1fRhut6DdPVhGmIDeSxuqrm1FlYPmQ
         dIgMfhV238yrGZZE9R8FOBfrrsbSKBDkE5o3A888fmYROwkBukD4e5N4rHjvHcNHsGkY
         ovd9LNiHr5R+pFd/5ZLrbMV4DA26Nz0jYa0lvRIi58prpEIzhMZJuMqA7z4hExM06gvl
         gN/sM+PzdAdH1XM4kTjBytNQk3vI1cW/fOyvxNXfqKcBOr1TP3e/xm3hi3+9tVknJvCI
         UdQQ==
X-Gm-Message-State: ANhLgQ03XCKzG5xD+3xiXtaNuSAlUb2xXwtIYsjh5vuUR6UxvZ1DAlIt
        FZVv1pO7Nszo9zemNmehJZiDIYx3ey3Hx21tYufRXA==
X-Google-Smtp-Source: ADFU+vu6HqaH4j3SJuv247SDzYUyvCKTi4MauowZ3Ck69fFNO8x9HHykET10xqulLd8bodNOiiPts9wgXPa49Wa6eH0=
X-Received: by 2002:a2e:894d:: with SMTP id b13mr8156479ljk.99.1583746761788;
 Mon, 09 Mar 2020 02:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200306010101.39517-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20200306010101.39517-1-alexandre.belloni@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Mar 2020 10:39:10 +0100
Message-ID: <CACRpkdZ_GdA=37mng6OBA=9JAVGxesAJF2_DeYBOzJy3Y1UvDg@mail.gmail.com>
Subject: Re: [PATCH] rtc: ab8500: switch to rtc_time64_to_tm/rtc_tm_to_time64
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Mar 6, 2020 at 2:01 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> Call the 64bit versions of rtc_tm time conversion.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
