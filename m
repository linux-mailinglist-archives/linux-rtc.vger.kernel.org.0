Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF0E2B7055
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 21:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbgKQUmF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 15:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgKQUmF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 15:42:05 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CC2C0613CF;
        Tue, 17 Nov 2020 12:42:04 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id y16so25865881ljh.0;
        Tue, 17 Nov 2020 12:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1mvK1rTvNHp8OWuHweKbclrnF4kBdtJK7w3CO0oFJlY=;
        b=rPZwRpYb9MU1nhJy5IC2GPvYfEyAfBT84/HDKZoLOZxAlhueAJgBJ9DirB9RfJX+lr
         kapGxDCwpXbqNur/AmtMjlqH4Bd1T0U2hwpuef9HPvBapnIM96GQXtJfJlRTY7+11fSE
         OnNH1Ln3IREIfGmC+r1kKIZ+BHbfobS/cNQ74BxcFiO/IQN31xSp5YOe0nlAX6jyc1Z/
         674sZVn2/XwUC66u+mnphGK0pixY+bPV64fa0A5aBMPwjt+9uN9rkjb0gCyFBmjEC6sA
         CAd+n5LjVSdLI2Aj+2DDsezlEndo41qWmpQVL02bhkGEdAAikCbD1ecP5QRIliT/jdbX
         y+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1mvK1rTvNHp8OWuHweKbclrnF4kBdtJK7w3CO0oFJlY=;
        b=JmaPwSLKHKudaneivXaFdnjpI5i89Ig9vLBuiUo0ks9LeLZwEqSxRZU1N4g/RKq+G4
         b4Pnu3hcqvMP9iyy4FdM7Km/VOuJUf7xG5iQo4xq2W3i5x1dcHhWoWB9S5gmuVBkhaSa
         mLuaa7PdCXQ90Up69DzahaTm13y2uV/Of5nXRuITsS0vteRaTo9m/yAkLwAHfnIUDBLe
         lzHh/qAsN58bOgPXDC/ZtaSmqI/LdyIRfnul3lqaJY9eSbKRpdyuNSvDqDqbkAB+JFyE
         fNlxf4RfoMso4I2YpScsIshYWG9pTePRd4libIi5xCV+wZZysPV55Da/7Wv+Z2hCC9pM
         2XOA==
X-Gm-Message-State: AOAM530ltmTBQ49bYD65TkVuf/TmQLg13ZKgsZf7tyT4XpOfj6hw1DFX
        BwTKWSzBd4rjwbZ1V0W6eqBJ49b154Ai30nuCdZIZOnGJuU=
X-Google-Smtp-Source: ABdhPJwsZCkcG1uH9yX5c8JF6jyWYTclASxwaiShDuyQLWO4hd216fz9a6sXNkJEPGdGtMIKhtnJgh5HB9ldvckWYpc=
X-Received: by 2002:a2e:9450:: with SMTP id o16mr2341461ljh.178.1605645723187;
 Tue, 17 Nov 2020 12:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20201117203035.1280099-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20201117203035.1280099-1-alexandre.belloni@bootlin.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 17 Nov 2020 17:41:51 -0300
Message-ID: <CAOMZO5C08wfqgpFNLZzZFJyWjELPXj5rp2SZ9qXGzeX6d28xgg@mail.gmail.com>
Subject: Re: [PATCH] rtc: mxc: use of_device_get_match_data
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Nov 17, 2020 at 5:30 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Use of_device_get_match_data to simplify mxc_rtc_probe.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
