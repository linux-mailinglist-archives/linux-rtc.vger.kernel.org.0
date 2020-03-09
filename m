Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2505917DC6F
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Mar 2020 10:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgCIJaW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Mar 2020 05:30:22 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33828 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgCIJaW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Mar 2020 05:30:22 -0400
Received: by mail-lf1-f65.google.com with SMTP id i19so1133308lfl.1
        for <linux-rtc@vger.kernel.org>; Mon, 09 Mar 2020 02:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5BPdUCBHlhfxC1rf07ErhiV9Y3RjZ/uMH/FRYyL0Tdo=;
        b=NT6VnCACPTlfQ6tWkirEMRPIFXPc5uK7jgSYi0wnLddxfiCCEj05iElpYaDaH3cZ75
         LqklW21zdCUaNQtn3QFqKyHl0yqr3btYYcm5H6Ka7nVRYJi04kLWL8ehoZFX1T24ci5g
         68/yypQ2HROcI28ReRXFtzEcA7Ukj6JPraEAdjarZILSamvIOefZJJWw3gLWYzIwGyGC
         3rpk0OwRTmQqrGN3iAIz8L9gh1kwpAMa+0uGcPJsfKdGw3qvXLH5MFsbn2Q6I5rsamHy
         i56/xRCkG/2LfWs+C5mD5MK4iVGp5H+Tq4JO1XVq4f0TI9JDDCKnLuIw71tA9Kuzi0/w
         GcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5BPdUCBHlhfxC1rf07ErhiV9Y3RjZ/uMH/FRYyL0Tdo=;
        b=bFlgEFnP7ytlxtZ8+ybj3osPbgQGXCFKWuMWyNql1VySWAfmVXmGSG3PkZ/gGrj0Cd
         9MgVRDRadGU7yvfS7FomLOQrHAPXVdUENgnWJ8Nvn3NYXERnLwlke1BLHDJ/90OSRWLK
         COD4bGe713I1bqzVg8t1z5RibTdLUYSNydHAIK1+HY/ZrzAtDpoPb5ZtDFslXEGCGnZv
         AzbCS1hTUFtmELzkzrF8MiswUh7ssUwOyLxDVICoJOfuNK2driJV9HedmvClDesSPPtg
         XREi+YXnKn1KmUKUETB968hO3dS0Mc5B6FKUP7i/QZ1v/2ANcoCWqv7d4IqHWYZjzwq/
         KicQ==
X-Gm-Message-State: ANhLgQ2pKJjdPQwyy7O6gRpnJHGnVIrv6AwqtTOuZfjjhOMYwbdcw4S0
        QwSnYsekY8OWyqXV861da+SjAEVg/WexeyqqW4PyWzN+
X-Google-Smtp-Source: ADFU+vvOV5BngHUN/iOXkIp0aCZj3DO7RIX6/Jfe8ek7Mb4Q3qAwKJPpaPcDy0NqYQc1dT6I+NcBqHSrx9nC2FYST9M=
X-Received: by 2002:ac2:5e6d:: with SMTP id a13mr9224214lfr.89.1583746219481;
 Mon, 09 Mar 2020 02:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200306005809.38530-1-alexandre.belloni@bootlin.com> <20200306005809.38530-2-alexandre.belloni@bootlin.com>
In-Reply-To: <20200306005809.38530-2-alexandre.belloni@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Mar 2020 10:30:08 +0100
Message-ID: <CACRpkdbs_wtyU5wjqFcdpYanA9ZMRczysw4kwkA7y+qeB0pHEw@mail.gmail.com>
Subject: Re: [PATCH 2/3] rtc: pl031: set range
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

> The PL031 and ST v1 RTC are 32bit seconds counters. STv2 is a BCD RTC
> apparently going from 0000 to 9999, hopefully handling the leap days
> properly until then.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
