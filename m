Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DACDABE19
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Sep 2019 18:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730413AbfIFQ4O (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Sep 2019 12:56:14 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36131 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfIFQ4N (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Sep 2019 12:56:13 -0400
Received: by mail-pg1-f196.google.com with SMTP id l21so3823235pgm.3
        for <linux-rtc@vger.kernel.org>; Fri, 06 Sep 2019 09:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=khSISmDs8BJQ4FTYTxZnbVWIBB1FiQsVmFwhUOKpZSM=;
        b=fC8CMseB6BVuogyR2ZnoGXAzlmprqs0RnjlaUVhsO9bmGmb0nKhxhAVrn3gPPV/PYP
         56oRNaUcfjBU9HpWd/dakx4VbHzqZv8e6jsppXkCTh11JRPQsPZftZeTXfdktv60CR2T
         hyNO9VdPrZg6YjEphv1OthPcXOxKq00gdUin3fAbqosi206DNtuJIgb3OT6fqRDndBBq
         jeU/i7O5wrfUA7KmFi+CCNTJ3jkO2CFsoK/yN03UvvBtuzXSj68uz913/WegIDkpk+FU
         pc8OjttkDKFRwHI+dapGTtDmQlAieCTqq4rpwUgC+m5it3R1fLYRf1pPJ0sLGir4KMI8
         D4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=khSISmDs8BJQ4FTYTxZnbVWIBB1FiQsVmFwhUOKpZSM=;
        b=i2izJqmYPbwXAr2Fp7PjRTOjSLNl+oGAFb4JelJb2UDVzozw19a+XqVQAW9ZdLnaGg
         ZBrHBeghPSsBNFfcPlPSiy63JW9zPqXJ8Xg2F8bb418HvDJSIvCkRTRle3WQFtTXNrrS
         qdlUFwYmBZwROMSQTnPtf+ZzhXedfxc0TXIpmH6wapBqM+Ue9upCSFRPy6IgI9zf4834
         m5NN/kTCypXWQtCDpJlcpbXygPGMMcpBtt0jnd28gtuH8OdG0E4We9W32nLmnLJYRXfX
         QVjGssUV/II4/X8HELtTqxKhToQBtuc1TVuNM2tr7ESIdGm3i3F6RK0jHQakgrZvC6vO
         UGAg==
X-Gm-Message-State: APjAAAVm08x1tTvEtHvZsHpjteOMRhYLR9DIjKay2nVycDO2ExHsyuAN
        gWYZ5jtXRNWz5jHBDLv1/Y5LIA==
X-Google-Smtp-Source: APXvYqxHMfju2ZwUAufiqyWRVABILob2U6DZ8JT+r0SfPfvsaI+o2zremKpT6Ldth18K0bYYbX6+NA==
X-Received: by 2002:a62:524a:: with SMTP id g71mr11734144pfb.154.1567788972891;
        Fri, 06 Sep 2019 09:56:12 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id u9sm6435931pfn.29.2019.09.06.09.56.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2019 09:56:12 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Arnd Bergmann <arnd@arndb.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: meson: mark PM functions as __maybe_unused
In-Reply-To: <20190906152438.1533833-1-arnd@arndb.de>
References: <20190906152438.1533833-1-arnd@arndb.de>
Date:   Fri, 06 Sep 2019 09:56:11 -0700
Message-ID: <7h1rwtict0.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> The meson_vrtc_set_wakeup_time() function is only used by
> the PM functions and causes a warning when they are disabled:
>
> drivers/rtc/rtc-meson-vrtc.c:32:13: error: unused function 'meson_vrtc_set_wakeup_time' [-Werror,-Wunused-function]
>
> Remove the #ifdef around the callers and add a __maybe_unused
> annotation as a more reliable way to avoid these warnings.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

