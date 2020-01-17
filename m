Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED490140D23
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jan 2020 15:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgAQO5r (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jan 2020 09:57:47 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:46947 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbgAQO5r (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jan 2020 09:57:47 -0500
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <guilherme.piccoli@canonical.com>)
        id 1isT4D-0004xw-32
        for linux-rtc@vger.kernel.org; Fri, 17 Jan 2020 14:57:45 +0000
Received: by mail-wm1-f69.google.com with SMTP id t4so2363032wmf.2
        for <linux-rtc@vger.kernel.org>; Fri, 17 Jan 2020 06:57:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bl+dn0eKBCfWfVtYzUntE9/lKcSw0MSM/eNVP34P46E=;
        b=mwO448Q0IbaamGYG2hwOIfNeoaH0rx4UEkxyc/JwAfgcwHN3/NQVVISo6AjOEt9aik
         ZVpsKXSLkcTHw6wvocaNLWhjdZzQU8tc01pyhpV/2Lbe0Z/rFF9q5b6y2sR+ZRKZkMks
         39tU5MZGfHmwrKbrJE/9v3b1RHDjZBrmZlsHTVKb9BETHVzLdXgXVy4qj4ng3TQSJhe5
         8BRLc3PQqvNwQIP4yvs7vP05MQby+upca8Qjg7bCNOQeiQpTpAFNEuz5mj1dx8sXGY+S
         GK+/I5fHNCrn+4W8eE/GwoSA8GIMV4spq91ugi3A8p2QF+CLZ1nWwPgdRxvBqP3isKHw
         u64g==
X-Gm-Message-State: APjAAAVNv3FGIe6ynXDQ6OT+0MsaIQUm+ul3DL5VmMmk2igpQ/xB2Jat
        ArHgeBAyLJkwegajv2vPmRqgQfI+g+WnP2iD4VK4CTRhNS9t3vaRX103/H7bO/V7tPvAVsP88Uv
        yEVVb6aj9145Dh9k4HWHU+7ZgxGSm8goa3s4mmFLrroGmKJwTPtEc1Q==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr3473480wrw.391.1579273064824;
        Fri, 17 Jan 2020 06:57:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwihlHNfvrbZEWHbjtS7J3d2mBR4Id8F7WwTNvA5JKuI8yaRGFqaGiaqpyMROK3LQsn4oqe8I7Rn3iZLJkrQEQ=
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr3473465wrw.391.1579273064657;
 Fri, 17 Jan 2020 06:57:44 -0800 (PST)
MIME-Version: 1.0
References: <20200103140240.6507-1-gpiccoli@canonical.com> <20200108174111.GD32742@smile.fi.intel.com>
 <87h815ybxo.fsf@nanos.tec.linutronix.de> <4882eca9-c5dd-a37c-bc13-14108300fd92@canonical.com>
 <9b04b099-0495-d188-7002-cad1147b61d0@canonical.com> <20200117144220.GU32742@smile.fi.intel.com>
In-Reply-To: <20200117144220.GU32742@smile.fi.intel.com>
From:   Guilherme Piccoli <gpiccoli@canonical.com>
Date:   Fri, 17 Jan 2020 11:57:08 -0300
Message-ID: <CAHD1Q_y+9fK_CcmE7VF1XrATQA-Ru9O9=9XyGNvzxwu=Z-q9yQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: cmos: Don't enable shared interrupts if using
 HPET-based IRQ handler
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        "Guilherme G. Piccoli" <kernel@gpiccoli.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jan 17, 2020 at 11:42 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Let me come out with something such as Thomas suggested.
>

Thank you Andy! In case it's gonna take a while (like more than 1
kernel release), could we get this one accepted to mitigate the issue
meanwhile?
Cheers,


Guilherme
