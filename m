Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A318414573C
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Jan 2020 14:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgAVNxn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 22 Jan 2020 08:53:43 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41139 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgAVNxn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 22 Jan 2020 08:53:43 -0500
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <guilherme.piccoli@canonical.com>)
        id 1iuGRw-0002s2-Tu
        for linux-rtc@vger.kernel.org; Wed, 22 Jan 2020 13:53:40 +0000
Received: by mail-wm1-f69.google.com with SMTP id c4so2122800wmb.8
        for <linux-rtc@vger.kernel.org>; Wed, 22 Jan 2020 05:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y5yptEkyrRbLvaccFMnqXZIPixdorHXoMP06yHQ05yU=;
        b=Sjc1mOgpC7Ww2psbF10ZA9VCBZJ2QpsXORSXl9uDgPTtOZKNDgepBLUa6lGCvYrgYZ
         pkMc+nSIhDktcNG8noKybwkBgb52FhSIp/iovCPoTFpSpxEhQyBaub707LiB6Ni1rowP
         Ndej7EKCjwNnswXxKdWhz0q2y+zpaL3seIKK28J8tlHplwFClxZ/IxQAlhEDVKvBys65
         3pig+bkcpRfTpC9X8MP2xYylWtVFNKVtaKW2YJt8U4NUOnZcOnTuKFdownuo4GGe4MKB
         w4zH6K2FptsBrKAiXQfHgjrYluie7254jPOcc6/vKsRbfew11I7jlPL7wpKsXUWrSWwx
         mxyQ==
X-Gm-Message-State: APjAAAW/E6WWXcv2G4huDLGaQcep5tF9LQDHjkBW8ycjvEcsxRYEnDRf
        8GxClAVqAcfSA98cdgcR9TJzOGgvuY2kLHi8iRgH2g0R+5mXGOZUn7/QKXYhwc3XRVCu50of85u
        tzWTDgR/W5q+XA27Qh8yrkSbulYtfCoXv0VPkaDHnN2LfL7lLiQsSEg==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr11211157wrm.131.1579701220684;
        Wed, 22 Jan 2020 05:53:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUz0jEsW9sXwSOEu5jc3NKfKm1f1tvIJ9U/ntW4xNZK1uUAUiFRkDLwRNPZVtygguuP3RUeVsEGMygtLGzUH8=
X-Received: by 2002:adf:dd52:: with SMTP id u18mr11211144wrm.131.1579701220513;
 Wed, 22 Jan 2020 05:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
 <a4a30d2e-b7eb-0f2e-933d-97f5bb006428@canonical.com> <20200122133850.GK32742@smile.fi.intel.com>
In-Reply-To: <20200122133850.GK32742@smile.fi.intel.com>
From:   Guilherme Piccoli <gpiccoli@canonical.com>
Date:   Wed, 22 Jan 2020 10:53:04 -0300
Message-ID: <CAHD1Q_z73kxvBM_Es7NJj+5j6DMYbh-tr6PJRv6Z7DDAzd7g8w@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] rtc: cmos: Use shared IRQ only for Microsoft
 Surface 3
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-rtc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Jan 22, 2020 at 10:39 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> [...]
> Thank you for testing!
>
> (Un)fortunately I dug a bit into the history of the patches and into the ACPI
> tables of MS Surface 3. I have another (better) solution which I will send
> separately from this series.
>

OK, if possible, loop me in and I can test that too.
Appreciate your effort on this!
Thanks,


Guilherme
