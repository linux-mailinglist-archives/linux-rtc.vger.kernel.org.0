Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57E9617DC71
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Mar 2020 10:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgCIJa5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Mar 2020 05:30:57 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45655 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgCIJa5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Mar 2020 05:30:57 -0400
Received: by mail-lj1-f195.google.com with SMTP id e18so9122707ljn.12
        for <linux-rtc@vger.kernel.org>; Mon, 09 Mar 2020 02:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TYcdgI6FvewhDZOpmZcO42Ni58JD8wtrbZBYBFXrvO0=;
        b=sRH0acWgVBB+9NR/UF5Prr3uv/MZcxnZ+8nOsAZrAiX2cGHuBUSZGp5KF76D51wW5+
         1vYXf1TBVeSiGoEsT2pmlwUhOuepbYKdlkjCPVCw4sBtFaOPwmOdSJI3sSaM7tq0uNG6
         siccDlzUYxpVRNs2MaD9/nYbm8BWPBDdVmWXomSKG9mCt46XKyPZpSuLt8OvyB83k2mi
         L2eZQBNi55o/zfEG7a/Zm0ke8ZxW9xPo8Hok6vXKrAiSYV7mXwPnnJRr6635mKt1SMGC
         Dsrukcb2WSwlW6OQ5Ee68+LNBCmgcXiVt3Fhz4fwpJGbbJpPcJHgCykIMfdN9OKiFTGh
         T/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TYcdgI6FvewhDZOpmZcO42Ni58JD8wtrbZBYBFXrvO0=;
        b=dTKVaZciMO9wAG3t5wNkeUW930AWnleuRCzV2aacWQYr78xoVcYBaZa71Pdj8BqBxg
         AlATW+tb54QNrfu3kpcYLd95mj450DUIQo2brlR1NuKHQHu8ixFpI87V/SqPA2wH1NGe
         +fsyeDNDzezhZCvNSJB/aTsj/7lMph5RoF0kc1a419cVC+fnYTjexWz/ZF2rd8+1U6L8
         qDP9F2K25efFMzXd+ClnBRddjy8Xdiid79PGx4bO3VmMV/Xa32upTNsWoIUAWvpEXwp+
         nPXaxqd5oDni6FXQCJIWdoVlER+Z0oVkP6pv73UDaPqpeXm5BY7h0XdAKCd6q6+XETie
         RV9g==
X-Gm-Message-State: ANhLgQ1x3dTF8f51PU32WIEwswpB+wRmIMbCNJqGRPxMmiKaBMpAAAvN
        fb41F/IAavUHKRJ4g4DplFwxtgPIDBGguEt3wtYEz5ox
X-Google-Smtp-Source: ADFU+vuye/I8arS2yl53n56BiFwgYP0noR11NDx+eCmf1Q8F7bLzVJ3uGQe5T1ymxPZxIR9TSkq+SUJBK9BAL8hqd5Y=
X-Received: by 2002:a05:651c:1026:: with SMTP id w6mr908328ljm.168.1583746255448;
 Mon, 09 Mar 2020 02:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200306005809.38530-1-alexandre.belloni@bootlin.com> <20200306005809.38530-3-alexandre.belloni@bootlin.com>
In-Reply-To: <20200306005809.38530-3-alexandre.belloni@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Mar 2020 10:30:44 +0100
Message-ID: <CACRpkdZxnkni+zjYn2vgPGVLDMDghzdu8U4Parp8MSQb6CycfA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rtc: pl031: switch to rtc_time64_to_tm/rtc_tm_to_time64
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

On Fri, Mar 6, 2020 at 1:58 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> Call the 64bit versions of rtc_tm time conversion to allow extending
> support after 2106 and properly supporting the STv2 range.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
