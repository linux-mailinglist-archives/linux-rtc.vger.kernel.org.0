Return-Path: <linux-rtc+bounces-69-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E85947BE81B
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 19:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4C31281943
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 17:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0399638DCA;
	Mon,  9 Oct 2023 17:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n7htfkkY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1126BA53;
	Mon,  9 Oct 2023 17:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99C5C433C7;
	Mon,  9 Oct 2023 17:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696872720;
	bh=XDeMdfLHaRv+b+MlRUUeKv/nia38YeOU/WDZx5uPdgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7htfkkYUR12EIz1FfiE1jX2eFvUEHVFPryxLjmFbPuCO63JBXFgzZFBrFSr8POoM
	 nOqBt8Ex9K985cGV6+qhK/D41SCIeSdiXbcUvI9IgH95SuKRTpkX2tFZxU1fggV/Co
	 h4FDmqr5W2gDoU8y1iBRT+VGpOLpUw9MzF+NINbA=
Date: Mon, 9 Oct 2023 19:31:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: Jens Axboe <axboe@kernel.dk>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Richter <rric@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev,
	nvdimm@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-leds@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH 6/7] fs/sysfs/group: make attribute_group pointers const
Message-ID: <2023100944-fancied-garter-f09b@gregkh>
References: <20231009165741.746184-1-max.kellermann@ionos.com>
 <20231009165741.746184-6-max.kellermann@ionos.com>
 <2023100921-that-jasmine-2240@gregkh>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023100921-that-jasmine-2240@gregkh>

On Mon, Oct 09, 2023 at 07:25:57PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Oct 09, 2023 at 06:57:39PM +0200, Max Kellermann wrote:
> > This allows passing arrays of const pointers.  The goal is to make
> > lots of global variables "const" to allow them to live in the
> > ".rodata" section.
> 
> I'm all for doing this type of work, but this is going to be rough.  You
> sent patch 6/7 that hit almost all subsystems at once :(

The way to do this right is one-subsystem-at-a-time, right?  Why not
start there, doing it cleanly, and then at the end, change the driver
core and then just the subsystem pointers?  That should be much simpler,
easier to review and verify, and many more changes (and probably take a
kernel release or two to get through.)

thanks,

greg k-h

