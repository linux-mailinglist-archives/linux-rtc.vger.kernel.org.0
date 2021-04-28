Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB16936DF32
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Apr 2021 20:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243819AbhD1Sur (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Apr 2021 14:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240219AbhD1Suq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Apr 2021 14:50:46 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FC3C061573;
        Wed, 28 Apr 2021 11:50:01 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id p12so45391503pgj.10;
        Wed, 28 Apr 2021 11:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oIRIEOVJimwmXciBNwHjV56oidjYB1LUygCarYNWZok=;
        b=NEa9FZMqA/a/HxerVeksfaslwYtBDsUdVZmQCspOgGu5bQ+RmByLk3b1OjsU819kBi
         DiVomnSK0SlTfXfTx8KzyYbUIVMt7WrW/hHfZoHyc3gKKtaOj1yoVUKE1UAdx/eneOh9
         dWui7YpDER5wM5wktdAoic0w33iy4U2/sytknod4URLZLGX+ICSvMu7VDYC88ilG7b5K
         lfk3w/GIa3g76CSGRs+tLqUk8YS8/eevKKI0fCXrfYYbL0/cJUcIBrHsY6ZxGdxNbcoN
         qKxClbq/WIFRMvVgX2MdcisukSdvU+zGc9TbYSg2Y0NMd+pmao5A1C8XFOdei9ix5gqC
         q7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oIRIEOVJimwmXciBNwHjV56oidjYB1LUygCarYNWZok=;
        b=QclMMxk98kRgwrr2DRsRziNW0RDZA60awqrxtU1BO78N5+p14ztyyAx6ZUcMOY/61I
         gTIcyLEe1I+81h426BRIIDtfTW3u1b+vjupH7+PEVLtYILx/2X8yRcdSWTbFPGAjiHUz
         Y5Jtr47XTaItnOkwcHm45LImrpwCQHvEfYgjO5VA4oXwWajQEDjVwp7qJ78DWPSK6UPE
         vj/yySyBvYxBhpos7tnhRaPQl84RdYflnYODoFO3xrkoP5KGGTH46AtRYevPPDanLcwk
         hnoWdvcryym1PYVCsFwF1e0CjKMAvA7QfVtwFUlPQv0O3C53Z8IypuTVZQKnjJPm84K7
         eQWQ==
X-Gm-Message-State: AOAM530l46ovgsm/rj/GCHKT8/62OT3RtcZl+N+qkXoqQKiOd+UPwOl+
        6AW+D+7Fpt7p6CfaPDToN+Yiuc+v6i+fQRVX
X-Google-Smtp-Source: ABdhPJyb1Ps1V/ROHrusZW90RzMS0bfqWGFsXWdlUBiDgNEj5EePAesHPrS2GlXB5ODKytPRpnlBxQ==
X-Received: by 2002:a63:8c4a:: with SMTP id q10mr28459766pgn.106.1619635800526;
        Wed, 28 Apr 2021 11:50:00 -0700 (PDT)
Received: from localhost.localdomain ([198.148.102.224])
        by smtp.gmail.com with ESMTPSA id g14sm378239pfm.143.2021.04.28.11.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 11:49:59 -0700 (PDT)
From:   youling257 <youling257@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     hdegoede@redhat.com, a.zummo@towertech.it,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 04/17] rtc: cmos: remove cmos_rtc_ops_no_alarm
Date:   Thu, 29 Apr 2021 02:49:46 +0800
Message-Id: <20210428184946.23999-1-youling257@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210110231752.1418816-5-alexandre.belloni@bootlin.com>
References: <20210110231752.1418816-5-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

this patch cause suspend failed on my Bay trail z3735f tablet.

[  162.038713] PM: dpm_run_callback(): platform_pm_suspend+0x0/0x40 returns -22
[  162.038760] alarmtimer alarmtimer.0.auto: PM: failed to suspend: error -22
