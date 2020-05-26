Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4A61E2AAC
	for <lists+linux-rtc@lfdr.de>; Tue, 26 May 2020 20:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390211AbgEZS5z (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 May 2020 14:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390185AbgEZS5y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 May 2020 14:57:54 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A866C03E96E
        for <linux-rtc@vger.kernel.org>; Tue, 26 May 2020 11:57:54 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id c11so23708924ljn.2
        for <linux-rtc@vger.kernel.org>; Tue, 26 May 2020 11:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=iaBx7znxWo1MrYRBiql2+soIkNh2l0H7hKu39Bgo60s=;
        b=Kf4CbOEDYZ1Lr7rZKPHYMo3xuuEng5ZnHSpxo+ZRc6q4Gj5D2zM8uMiuQV+j9F30mo
         pqJnrgnUom3H8cPJDMNoMxxBk+VuSwVijsCvxvlDjk+5QWYxj5E4d9N6xEZXKG3rPLVY
         rk2gd4URrRS+Qqka1jWLVagqpM/c1xwJaE2s7MIAXAFJa3XTfQpcB5YIFnDMtpitZQDk
         PYBHSi2pugNUHs/dRT7LY4OKCbxZBomvNKPAdpCcuM8TzCBCb07v4WwfKxszBftxfKJi
         6ahPDHHvXWptxaUilNiCku9daneEt3uEBe80fkf2thT85aa7aLc8JpDuFOMaGJaqZJh9
         AQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=iaBx7znxWo1MrYRBiql2+soIkNh2l0H7hKu39Bgo60s=;
        b=jhBckP5xW/g/eMBLkYzmXXzpYbF2i6gvICl4m74r/sCF1LW6KTWmAnutMPabY4Ivov
         6i9T00RO/DV7mAp4s6vWROacdWcBe87AZmJvdgQt6zWdAoEYnuwsgmx1Iqizu9c5Hbtd
         I322UWdvhCRKz4ZpWjsHkLkE1jk3myQNkPI5M+N4UyCoXGPxKPFua5vY2okx3eSoe94u
         0qXjFYwneRDJjpXybvkwuWdhRZON6MhHx0CUc+uiOlBk6n/PEgOZbk/+ksOMffT0bklu
         Y1OovkeAVIUilm+3E42j3EtH1NS9dI673iyZ4B2Y3z+drTDFTU/iFY3LAmiF+vdZ9zby
         VxtA==
X-Gm-Message-State: AOAM533derT+IRtrnR98+fEeqRQJ2Ejj1DYgR+krAxiWUGN7novZ1m8n
        JTwDT/Ttmo+x2xLutSz7w3fhFH4C
X-Google-Smtp-Source: ABdhPJyqKcN2D5/1BNi+desyD1faBfgMb0YgpmkB5Em3jXU85ZeRIzdAVYjvctLzroBCJ1J9+b+A2g==
X-Received: by 2002:a05:651c:502:: with SMTP id o2mr1221867ljp.434.1590519472428;
        Tue, 26 May 2020 11:57:52 -0700 (PDT)
Received: from [192.168.1.10] ([95.174.107.249])
        by smtp.gmail.com with ESMTPSA id d11sm129458lji.85.2020.05.26.11.57.51
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 11:57:51 -0700 (PDT)
From:   Igor Plyatov <plyatov@gmail.com>
Subject: Automatical handling of /sys/class/rtc/rtcN/offset
To:     linux-rtc@vger.kernel.org
Message-ID: <810d81d9-847d-a849-bf8e-49ea59ba6b83@gmail.com>
Date:   Tue, 26 May 2020 21:57:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dear all,

I have found that my RTC  (M41T00) is capable to make precise 
compensation of offset in the Control register.

Its driver, rtc-ds1307.c has support for such offset compensation and 
provide the /sys/class/rtc/rtc0/offset file.

Compensation tested and operate as expected, when I manually read/write 
offset value (in PPB) from/into the /sys/class/rtc/rtc0/offset file.

Does handling of such RTC offset already automatized somehow instead of 
doing this manually?

I ask for community, because do not want to invent another one wheel if 
there are something already implemented for such purpose.

Best wishes.
--
Igor Plyatov
