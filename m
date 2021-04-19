Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B499364927
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Apr 2021 19:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233568AbhDSRnw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Apr 2021 13:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbhDSRnw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Apr 2021 13:43:52 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125D5C06174A;
        Mon, 19 Apr 2021 10:43:22 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o5so7293071ljc.1;
        Mon, 19 Apr 2021 10:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fSXNgIe9+tYFQbs496Z6e98rGeRIg3GpNFZftVXO/tw=;
        b=AUW8zI9rhsNjJ+082Qkf2hqfF8W9NWkZfVLmysoRXe6RHgDicHYBiiKIlnSgpT+BdD
         Rfveva79kFN1hGyWDiIpxcd0faRveuOWRWCidJyw5glY9RtvNqEmphuEZn4/77/zpjCH
         34Yq0heBA8fTYtUxC2mLDbxM8eucBAbZEbCS6FqLAyloWNERi3PyPmlDud9/7DiwznUK
         FNTrUNfhCBK/sXDlZMpcfYgHEdCgqNckba6XMnDyCKhVnGdmkO89kKjkp68Pp5aKbcKl
         8ofcFr+CmHj+3jgs/aOnI/5kLveMaMLENmsRcrSL7bU8HV4JNm55kTykI+rYgtQQGe/t
         Hjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fSXNgIe9+tYFQbs496Z6e98rGeRIg3GpNFZftVXO/tw=;
        b=fi864VQ3ku7i6iK8filF7kDy/08D7VuZUTDMhnPX2qUXBDTCkDsRIbDb0nhT4kSnfd
         T+CZwiF2B1ABuDLt5ihTZLlV8NPX/Xv8OQvXztjOtOtcNqHTDQ+vw4xx1DjqkHwiPPeJ
         Ng2/cPlY8tYHXULmrJoQ13BMBBjlLy6bcAUbPYwv0d2jHX/qylnuyhWeE8zPn6VOaDz0
         59guF+2BZ8jB6lw9Jnx7wHfKl2BTwG55ika1VaQMqPlTAcpE0rWHsFJRdtlNuJU+ULvz
         GQJDE2LfPkVeVK6vBae1thMfxfBcg/ZV+XyZoyd+O3V/jER+CjxnKo0Z+SzIWy8CaHIq
         dYwQ==
X-Gm-Message-State: AOAM5304HBRRrxWCyVc6TFU3YRaJTgaOP5DFFrny9MheTuXYPdRYjcM8
        uav8GOMwW5Ny9LcpW8d+Sv03zSUgO/MFdKCUNsw=
X-Google-Smtp-Source: ABdhPJwlF2WMqQ9rL9imI4AsKeFafLh3qaZgcFgwH0/3JpQrkV/1JaWV5cBW/A7ljsu4iE7eBDflpzQLXMr39YyFIW0=
X-Received: by 2002:a2e:701:: with SMTP id 1mr12056621ljh.264.1618854200523;
 Mon, 19 Apr 2021 10:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210417235205.994119-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20210417235205.994119-1-alexandre.belloni@bootlin.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 19 Apr 2021 14:43:09 -0300
Message-ID: <CAOMZO5Be45yAxqKzfbCJ0yjCgfNSc4_dZj0j8yEBegOk1kp2jw@mail.gmail.com>
Subject: Re: [PATCH] imx-sc: remove .read_alarm
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Sat, Apr 17, 2021 at 8:52 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> The RTC core properly handles RTC without .read_alarm and doesn't use it to
> set alarms. .read_alarm can be safely dropped.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
