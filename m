Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54CBF76F769
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Aug 2023 04:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbjHDCCZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Aug 2023 22:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232705AbjHDCCY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Aug 2023 22:02:24 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96BA448F
        for <linux-rtc@vger.kernel.org>; Thu,  3 Aug 2023 19:02:22 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-686f74a8992so269692b3a.1
        for <linux-rtc@vger.kernel.org>; Thu, 03 Aug 2023 19:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1691114542; x=1691719342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lLAyHP6q7d4xyqH5BrZ0J2y9ZHEmKn11Ag5iLKGIobk=;
        b=wP2ZuHLlNuDfTT71uzyzf0CV4FW0+5rHmVIqE6GOMVjwL3ZpUnT2g2DTt/WDPPdjrF
         2U2HC6n0rUbzNslkkp6Hn7rJWDpqfSmq9b66hXnpWCUj8YqrgFcHUJhG77/tAs47G266
         ElZhOuyclpDWX2rOoNKzHHzbVTAE54S07RIJ8OKTFKzcSexf0Gz621jhyP7rRN33bbXa
         tkJbJPIcYWZ4ZpCxxkdHqHPkTvp2YIFjPQGCcymM3t8fqWtXNJ1CJG5w9R5HSfJH6nCk
         KdkWaHmwZ/oMmmFXNOSYXCV4ARohZ/th4bdIj0Kq+d27AG7CIKhmk7x2SgAnQa4lZa+v
         ZR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691114542; x=1691719342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLAyHP6q7d4xyqH5BrZ0J2y9ZHEmKn11Ag5iLKGIobk=;
        b=bwVowjOkRdtz0slVb7pg+ROojttuEOI7XlfE+Prz0H83m891pxisK79vYenpM+SYCA
         Sv6A4fqCY3Pi5+9S2bUbhfmZGud0cH/H7DobjvyK/KI9uSmMK5n/DHTbiHuvSsK8HlyZ
         VLoK/pUNRXz9PHoplWWTZQQBcLSxYmpa8BAfXyxVWRMNH4n0LDNhcFO90xqBf1xKWiE6
         0bUWBSSjsvgXXX5TEHZwadmyInZ8ooZ3JOpj91PZmtOzfYfrmXzLNixwdfbNsKOeNZPP
         OX+dD2nCE59iwJVjdJ9B0i2Lma9F3VKx3sDdTDYQcKDMy0SS527Ztic7AWQWRTSsuL2m
         S8jQ==
X-Gm-Message-State: ABy/qLbu4+ZdGivQuMAZSKrumD5J/ia+jPjnxggfxX7rPIzcQSUgoMxE
        qDKXjHEgnpIPCqBSKVJXzfSK1g==
X-Google-Smtp-Source: APBJJlHGxvq+YAD+sdIdRb+NwnMfx8vt2DdNH34XqanHP+MVvvdnK8URPIL1n0IT/Nu8x7TU0I+uaA==
X-Received: by 2002:a05:6a00:8016:b0:675:8627:a291 with SMTP id eg22-20020a056a00801600b006758627a291mr20382970pfb.3.1691114542072;
        Thu, 03 Aug 2023 19:02:22 -0700 (PDT)
Received: from [172.20.1.218] (071-095-160-189.biz.spectrum.com. [71.95.160.189])
        by smtp.gmail.com with ESMTPSA id p18-20020aa78612000000b006871dad3e74sm471163pfn.65.2023.08.03.19.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 19:02:21 -0700 (PDT)
Message-ID: <5dbc41bb-f843-dcd9-37d6-cf1f37cb80d4@kernel.dk>
Date:   Thu, 3 Aug 2023 20:02:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [linux-next:master] BUILD REGRESSION
 fb4327106e5250ee360d0d8b056c1eef7eeb9a98
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>,
        kernel test robot <lkp@intel.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>
References: <202308040141.gUjtZ32J-lkp@intel.com>
 <ZMwH1WuEb1JEtZ4o@casper.infradead.org>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZMwH1WuEb1JEtZ4o@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 8/3/23 2:02?PM, Matthew Wilcox wrote:
> On Fri, Aug 04, 2023 at 01:34:01AM +0800, kernel test robot wrote:
>> arm-linux-gnueabi-ld: storage.c:(.text+0x27c): undefined reference to `__brelse'
>> arm-linux-gnueabi-ld: storage.c:(.text+0x9c): undefined reference to `__bread_gfp'
>> storage.c:(.text+0x22c): undefined reference to `__bread_gfp'
>> storage.c:(.text+0x64): undefined reference to `__brelse'
> 
> I think something like this would fix it.  Jens?  Christoph?

Yep, someone else sent one earlier today, but looks like they didn't CC
the list. In any case, I replied with it CC'ed and got it applied.

-- 
Jens Axboe

