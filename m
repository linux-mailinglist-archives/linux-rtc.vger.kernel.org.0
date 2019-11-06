Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF00F22BB
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Nov 2019 00:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbfKFXhy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 Nov 2019 18:37:54 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35752 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbfKFXhy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 Nov 2019 18:37:54 -0500
Received: by mail-pf1-f196.google.com with SMTP id d13so472494pfq.2
        for <linux-rtc@vger.kernel.org>; Wed, 06 Nov 2019 15:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I8dPU8PsIcjQN/qde2NZnnh3S5qLVWrToiL1ovmtnNY=;
        b=Ws7n2u3+b3+8KEXtZJewZYqykECNj6uA47mb/cDxScvuF7J8mD7C4qC58TQwUWfOhT
         zKiLyWDL8556asRqUA4bS5qUDJ0dNIFZ5veM3tP5KuIsKIMokH1TKDBFqiom+XC8B1n0
         T4MJXSSrD/wBLaLOdl4fL46deH893TQucIACAhPYdYId3aUBQigD5B1NgQDTvLr895qH
         ZUTosV/4fPVHtkzn8PKNYjX0OcXZebWpXVqxVFWTLQxBC6S6dnG7vqt608q65h7A3kJd
         bzeRGGVDTubEzwqtBiAnP7BRNsQnygMFmWlEtVzOeKChMgHte95VNYuCzUszrzSSQc7Z
         KhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I8dPU8PsIcjQN/qde2NZnnh3S5qLVWrToiL1ovmtnNY=;
        b=KINCv3Yl7XZrLya6WbUih2b9ak/pzAbGzzDCpkgWvhtnZkCraIjKm3G3MQRraG0ci7
         Yam/GAGwl+nWJIC3lntyVpae7+AaqwZPFRX3QOI3Fw5HZgMKY2opW3MP+conWKj3pS5i
         3CbbPvG5Q4ftgke/5Zgz4JR9RdmS/IX49JoZN4LbqGtEhLFVa3CHZg5Q9SCWEn5DcscG
         i85hKobKwNwTABlnFcL0trR1HVBBXucC4dp5efL5sMb1lWusUPxJ1hTGcPFky9t9M+Rl
         cZfqmSx9u3L8NFjvpKBDr2t1MHysPHJahFSnQ4qsLpvjDWneT0n7acPPNGuCNOSIEiSw
         QEvQ==
X-Gm-Message-State: APjAAAXhMOIgNXU3UoKZ8xAVj+ytzxk5b4TVAhb1TDDdW8mL3sOanfcQ
        J7ii4ITb9NJXyVJuiWo1m7KrxQ==
X-Google-Smtp-Source: APXvYqw9iZMhdp6QP4E2+vOP8jk/LTcrF0hI26oCv/HF5wbRGuVeoDYZzb1ZlU6yuqTo+vQkhG8n+Q==
X-Received: by 2002:a63:181f:: with SMTP id y31mr592777pgl.186.1573083471320;
        Wed, 06 Nov 2019 15:37:51 -0800 (PST)
Received: from smuckle.san.corp.google.com ([2620:15c:2d:3:8fbe:ee3b:c81d:238d])
        by smtp.gmail.com with ESMTPSA id i13sm92639pfo.39.2019.11.06.15.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2019 15:37:50 -0800 (PST)
Subject: Re: [PATCH] rtc: class: support hctosys from modular RTC drivers
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel-team@android.com
References: <20191106194625.116692-1-smuckle@google.com>
 <20191106231923.GK8309@piout.net>
From:   Steve Muckle <smuckle@google.com>
Message-ID: <b96f085b-8a0c-7c71-4fde-8af83d49823a@google.com>
Date:   Wed, 6 Nov 2019 15:37:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191106231923.GK8309@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/6/19 3:19 PM, Alexandre Belloni wrote:
> On 06/11/2019 11:46:25-0800, Steve Muckle wrote:
>> Due to distribution constraints it may not be possible to statically
>> compile the required RTC driver into the kernel.
>>
>> Expand RTC_HCTOSYS support to cover all RTC devices (statically compiled
>> or not) by checking at the end of RTC device registration whether the
>> time should be synced.
>>
> 
> This does not really help distributions because most of them will still
> have "rtc0" hardcoded and rtc0 is often the rtc that shouldn't be used.

Just for my own edification, why is that? Is rtc0 normally useless on PC 
for some reason?

On the platforms I'm working with I believe it can be assured that rtc0 
will be the correct rtc. That doesn't help typical distributions though.

What about a kernel parameter to optionally override the rtc hctosys 
device at runtime?

> Can't you move away from HCTOSYS and do the correct thing in userspace
> instead of the crap hctosys is doing?

Yes, I just figured it's a small change, and if hctosys can be made to 
work might as well use that.
