Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934D21B0336
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Apr 2020 09:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgDTHhV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Apr 2020 03:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726006AbgDTHhV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 20 Apr 2020 03:37:21 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED605C061A0C
        for <linux-rtc@vger.kernel.org>; Mon, 20 Apr 2020 00:37:19 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 188so3671426wmc.2
        for <linux-rtc@vger.kernel.org>; Mon, 20 Apr 2020 00:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=x4d8njD2ChzZ2kuDWBQWJtIw3UQE6E7sHmhOoB5ezqs=;
        b=s9Ej0RPYb9lJkeS+N4KaZqRVDOm/SMTuNsIfiyVl/sCG8tzdLnNngYV+RVgyER1R3F
         VRzB6TNY6rn0cuPvz+jDOcsgEm6vB1iflYdPxH4S/bamY84eTcqa+4vtDy05GKDS4zS0
         Kmm16bHrfBNiQYXYskNt3fsMJzTC+pNl8kFLLFI9UFzWOxH8F7RfDCklTUfNpN0f2I44
         VR2D/sc2g96ROMto0j2Rr+t14rZ1StFnVNPpwNhsirhV/Pqwh8cGs84i9OzxMvWPinBI
         Lffym77ABv9sVKQAf5rNjW5F0P8/MHbhNn36a9zIpouhrv8SW+gc2OjC9ud+o76ZOm5t
         peAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=x4d8njD2ChzZ2kuDWBQWJtIw3UQE6E7sHmhOoB5ezqs=;
        b=AbgvPSCNvw9RSV/6XJfjEsaRzybYMCzAemR1Je2F3KebsIawJItCRjJwblQD7Kz+cD
         UVv9WU5r4W3KI5id5HR0vE5VR8xWdSA8jZyCayl89fMTmUNkxLLy8HVTQFfB9PmtXc5E
         QnMxt6kTzy93FCclxJF254KhpzmFnxhfhNv0WqGFXTEVCRzU57M+rPUxN44Nw6ZD+Qt4
         JrDjc0c8b9v9ZSX9wsnvUXRgfzIZIr1ARvM4UUMZ4vPkP+cRWpa11QNqkjAb0LNr+UjW
         gJzdZZuht/2YyWMRFkLq7UWUMEkeo8xZFNaUYPjAGcd6XB6KGu25ow6ebBeBPdAAj75B
         jbRQ==
X-Gm-Message-State: AGi0PuZN44IgNwy/bWTeG6Os8VFIXGh3uIPFaBL1jQQpTKBlifLQKr/Z
        D2FHXK5dBWrj7BMO4rjdwlAKEg==
X-Google-Smtp-Source: APiQypI3JmmCDHjcMn3A1vzcEpxgsLlbI4LO3mEsYg5l0mrqs5au0PNliOvfe+fdVwtahiKITEMREQ==
X-Received: by 2002:a1c:6344:: with SMTP id x65mr16504650wmb.56.1587368238713;
        Mon, 20 Apr 2020 00:37:18 -0700 (PDT)
Received: from dell ([95.149.164.107])
        by smtp.gmail.com with ESMTPSA id y40sm43875wrd.20.2020.04.20.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 00:37:18 -0700 (PDT)
Date:   Mon, 20 Apr 2020 08:37:16 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Ran Bi <ran.bi@mediatek.com>
Cc:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Sebastian Reichel <sre@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Josef Friedl <josef.friedl@speed.at>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH v12 5/6] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
Message-ID: <20200420073716.GM3737@dell>
References: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1586333531-21641-6-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20200416091438.GA2167633@dell>
 <1587112169.12875.2.camel@mhfsdcap03>
 <1587113392.13323.3.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1587113392.13323.3.camel@mhfsdcap03>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 17 Apr 2020, Ran Bi wrote:

> On Fri, 2020-04-17 at 16:29 +0800, Ran Bi wrote:
> > On Thu, 2020-04-16 at 10:14 +0100, Lee Jones wrote:
> > > On Wed, 08 Apr 2020, Hsin-Hsiung Wang wrote:
> > > 
> > > > From: Ran Bi <ran.bi@mediatek.com>
> > > > 
> > > > This add support for the MediaTek MT6358 RTC. Driver using
> > > > compatible data to store different RTC_WRTGR address offset.
> > > > This replace RTC_WRTGR to RTC_WRTGR_MT6323 in mt6323-poweroff
> > > > driver which only needed by armv7 CPU without ATF.
> > > > 
> > > > Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > > > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > Acked-by: Sebastian Reichel <sre@kernel.org>
> > > > Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> > > > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > > 
> > > Please place these in chronological order.  They should provide some
> > > history, rather than a unordered slab list of random sign-offs.
> > > 
> > 
> > I suppose that you mean the order should be like below, right?
> > Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > Acked-by: Sebastian Reichel <sre@kernel.org>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> > 
> 
> Correction, I think following is the correct chronological order:
> Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

This looks better, yes.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
