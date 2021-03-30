Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C1934EC67
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Mar 2021 17:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbhC3P3B (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Mar 2021 11:29:01 -0400
Received: from clab.compulab.co.il ([66.147.238.35]:50950 "EHLO
        clab.compulab.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbhC3P2k (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Mar 2021 11:28:40 -0400
Received: from [37.142.126.90] (port=42044 helo=zimbra01.compulab.co.il)
        by clab.compulab.co.il with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <kirill.kapranov@compulab.co.il>)
        id 1lRGIH-0067zr-Ca; Tue, 30 Mar 2021 11:28:37 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id AF338E81CB001;
        Tue, 30 Mar 2021 18:28:34 +0300 (IDT)
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id sLEAGLXwZurp; Tue, 30 Mar 2021 18:28:33 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id 83C39E81CB018;
        Tue, 30 Mar 2021 18:28:33 +0300 (IDT)
X-Virus-Scanned: amavisd-new at zimbra01.compulab.co.il
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id j4DfoEnIk4zg; Tue, 30 Mar 2021 18:28:33 +0300 (IDT)
Received: from [192.168.11.10] (lifshitz-linux.compulab.local [192.168.11.10])
        by zimbra01.compulab.co.il (Postfix) with ESMTPSA id 57F7AE81CB001;
        Tue, 30 Mar 2021 18:28:33 +0300 (IDT)
Subject: Re: [PATCH 2/4] rtc: abx80x: Enable SQW output
To:     Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        phdm@macqel.be, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org
References: <20210329061956.GJ1717@kadam>
From:   Kirill Kapranov <kirill.kapranov@compulab.co.il>
Organization: CompuLab Ltd.
Message-ID: <050f0a83-2f67-ecf2-338b-1f2501d84e14@compulab.co.il>
Date:   Tue, 30 Mar 2021 18:28:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210329061956.GJ1717@kadam>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - clab.compulab.co.il
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Get-Message-Sender-Via: clab.compulab.co.il: mailgid no entry from get_recent_authed_mail_ips_entry
X-Authenticated-Sender: clab.compulab.co.il: 
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Dan,

Thank you very much for pointing out the issues.
However, I'm not sure that the code, you have analyzed, will be a part 
of final patch set. I intend to redesign all the code deeply, as 
Alexandre Belloni suggested [1].

Thank you again!

-- 
Best Regards,
Kirill Kapranov
Software Engineer
CompuLab Ltd.
[1] https://marc.info/?l=linux-rtc&m=161696606727215&w=2

On 3/29/21 9:19 AM, Dan Carpenter wrote:
> Hi Kirill,
> 
> url:    https://github.com/0day-ci/linux/commits/Kirill-Kapranov/rtc-abx80x-Enable-distributed-digital-calibration/20210329-053233
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
> config: i386-randconfig-m021-20210328 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/rtc/rtc-abx80x.c:561 sqw_set() error: uninitialized symbol 'retval'.
> 
> vim +/retval +561 drivers/rtc/rtc-abx80x.c
> 
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  527  static int sqw_set(struct i2c_client *client, const char *buf)
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  528  {
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  529  	union abx8xx_reg_sqw reg_sqw;
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  530  	int retval;
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  531
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  532  	reg_sqw.val = i2c_smbus_read_byte_data(client, ABX8XX_REG_SQW);
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  533  	if (reg_sqw.val < 0)
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  534  		goto err;
> 
> "retval" not set.  Forgetting to set the error code is the canonical
> bug for do nothing gotos like this.
> 
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  535
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  536  	if (sysfs_streq(buf, "none")) {
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  537  		reg_sqw.sqwe = 0;
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  538  		dev_info(&client->dev, "sqw output disabled\n");
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  539  	} else {
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  540  		int idx = __sysfs_match_string(sqfs, SQFS_COUNT, buf);
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  541
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  542  		if (idx < 0)
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  543  			return idx;
>                                                                          ^^^^^^^^^^^
> These are direct returns.  Just do direct returns everywhere (more
> readably, fewer bugs).
> 
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  544
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  545  		if (abx80x_is_rc_mode(client) && !valid_for_rc_mode[idx])
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  546  			dev_warn(&client->dev, "sqw frequency %s valid only in xt mode\n",
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  547  				sqfs[idx]);
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  548
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  549  		dev_info(&client->dev, "sqw output enabled @ %s\n", sqfs[idx]);
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  550  		reg_sqw.sqwe = 1;
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  551  		reg_sqw.sqws = idx;
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  552  	}
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  553
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  554  	retval = i2c_smbus_write_byte_data(client, ABX8XX_REG_SQW, reg_sqw.val);
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  555  	if (retval < 0)
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  556  		goto err;
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  557
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  558  	return 0;
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  559  err:
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  560  	dev_err(&client->dev, "Failed to set SQW\n");
> 3f6d456de4f347 Kirill Kapranov 2021-03-29 @561  	return retval;
>                                                          ^^^^^^^^^^^^^
> 
> 3f6d456de4f347 Kirill Kapranov 2021-03-29  562
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
