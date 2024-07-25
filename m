Return-Path: <linux-rtc+bounces-1578-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C84093BF7A
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 11:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FD0A1C212E6
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 09:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3596A19885B;
	Thu, 25 Jul 2024 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="G37yyxeg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86973197A77;
	Thu, 25 Jul 2024 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901387; cv=none; b=AMPW9rS8Vf2QnfeTkr69a9cyYjHi0k/MCeq1+dJWt+H98l6O9GNPNPYbMhnyMNDyL/sqnP5H7AHNfBNmOwCUZyw9J+kGxfHSiSoObBRLBJiqB8A2WtQZdJWJ+E0qtL0zU3KAfkXcpemyKPNif6l848cXC0H+PifVQlgXob/vZV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901387; c=relaxed/simple;
	bh=NoHdoUNeLmfHI5iwlppoWV2frr16ZLxf2s8E8Afs+u8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cGy7k1TsOesKvziFjrWCMCHcrbFQnSe0kt07dYswWMaCL5jmrsRC5IdaNLrkDNlUczPVI8PcCsgLUPIlLPeUNkU1rBiRJkj8n1tzZxt1IE0iDiAKmVrJSDoo9+1Qyeq9WrrG3ecSNDv1Rb4JLhi85DVzAcVGGNooKPiwNNNtqkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=G37yyxeg; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NoHdoUNeLmfHI5iwlppoWV2frr16ZLxf2s8E8Afs+u8=; b=G37yyxegAudRmueUo2y6ZXfpBT
	WbK78Xl8vVglPstTZQ0vjn7VmExgtloGfXSm3A4ZMDLJ2TI2OWUoTtkW976dLqXOTdie9EfqDNn+1
	jVsjvDEncj1nWY0/11TFKLt878zVCtClmZyZ7vYBDnUHa+5+JK1V4ZWcL7xidRj8tnZtDNcVVeKau
	8PtZO18vh3uNcJZZJQWGtAVucFoB7ATWQjR/tZ7FzEe9UfhKNWw7oMOg0eAzvPQ2H7oCG59JbLzMY
	KQjo+LpxwX7LIBjJxsy01o5/jrxpsMBfNivcjqIy2G723PV+wbxyAYQcLTDsDHHhyxU1r8mYlI5s0
	13keeUKQ==;
Received: from [2001:8b0:10b:5:25df:2ae1:4889:ee99] (helo=u3832b3a9db3152.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWvCh-00000008ltP-3FON;
	Thu, 25 Jul 2024 09:56:07 +0000
Message-ID: <7de7da1122e61f8c64bbaab04a35af93fafac454.camel@infradead.org>
Subject: Re: [PATCH] ptp: Add vDSO-style vmclock support
From: David Woodhouse <dwmw2@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Richard Cochran <richardcochran@gmail.com>, Peter Hilber
 <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org, 
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>, 
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>, "Chashper,
 David" <chashper@amazon.com>, "Mohamed Abuelfotoh, Hazem"
 <abuehaze@amazon.com>,  "Christopher S . Hall"
 <christopher.s.hall@intel.com>, Jason Wang <jasowang@redhat.com>, John
 Stultz <jstultz@google.com>,  netdev@vger.kernel.org, Stephen Boyd
 <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Marc Zyngier <maz@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, qemu-devel <qemu-devel@nongnu.org>, Simon
 Horman <horms@kernel.org>
Date: Thu, 25 Jul 2024 10:56:05 +0100
In-Reply-To: <20240725012730-mutt-send-email-mst@kernel.org>
References: <14d1626bc9ddae9d8ad19d3c508538d10f5a8e44.camel@infradead.org>
	 <20240725012730-mutt-send-email-mst@kernel.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-Hh5AJCYJEgXbGuGNszvM"
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-Hh5AJCYJEgXbGuGNszvM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael, thanks for the review!

On Thu, 2024-07-25 at 01:48 -0400, Michael S. Tsirkin wrote:
> On Wed, Jul 24, 2024 at 06:16:37PM +0100, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >=20
> > The vmclock "device" provides a shared memory region with precision clo=
ck
> > information. By using shared memory, it is safe across Live Migration.
> >=20
> > Like the KVM PTP clock, this can convert TSC-based cross timestamps int=
o
> > KVM clock values. Unlike the KVM PTP clock, it does so only when such i=
s
> > actually helpful.
> >=20
> > The memory region of the device is also exposed to userspace so it can =
be
> > read or memory mapped by application which need reliable notification o=
f
> > clock disruptions.
> >=20
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > ---
> > QEMU implementation at
> > https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/vmcl=
ock
> >=20
> > Although the ACPI device implemented in QEMU (and some other
> > hypervisor) stands alone, most of the fields and values herein are
> > aligned as much as possible with the nascent virtio-rtc specification,
> > with the intent that a version of the same structure can be
> > incorporated into that standard.
>=20
> Do you want to just help complete virtio-rtc then? Would be easier than
> trying to keep two specs in sync.

The ACPI version is much more lightweight and doesn't take up a
valuable PCI slot#. (I know, you can do virtio without PCI but that's
complex in other ways).

So I do see these existing in parallel, and I'm happy for the VMCLOCK
device to defer to the shared memory structure in the virtio-rtc
specification once that's final.

I've done my best to ensure we have a fair chance of it being adopted
as-is, and it's versioned so if virtio-rtc gets published with v2 of
the structure, that's also OK.
>=20

> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (st->clk->magic !=3D VMCL=
OCK_MAGIC ||
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st->clk->=
size < sizeof(*st->clk) ||
>=20
>=20
> This is a problem and what I mention below.
> As structure will evolve, sizeof(*st->clk) will grow,
> then it will fail on old hosts.

Potentially, yes. At the time a guest starts to support a larger
version of the struct, it would need to check for the size of the v1
structure.

We certainly *allow* for the structure to evolve, but as you say this
is ABI. So we've tried to plan ahead and avoid having to change it
unless something *really* surprising happens in the field of leap
seconds.


> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* If the structure is big e=
nough, it can be mapped to userspace */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (st->clk->size >=3D PAGE_=
SIZE) {
>=20
> This is also part of ABI. And a problematic one since linux can
> increase PAGE_SIZE at any time for its own reasons.

Yes. For it to be mapped to userspace, the hypervisor has to put it
into a memory region which is large enough for the page granularity
that the guest happens to use.

The hypervisor implementations so far (for x86 in QEMU since there
seems to be no ACPI support for Arm?, and for x86+Arm in my other pet
hypervisor) expose a 4KiB region.

So if the guest uses larger pages (and can't cope with using 4KiB PTEs
for MMIO mappings), then it can't use this feature unless the
hypervisor gives it a larger region. I think that's OK.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0st->miscdev.minor =3D MISC_DYNAMIC_MINOR;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0st->miscdev.fops =3D &vmclock_miscdev_fops;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0st->miscdev.name =3D st->name;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D misc_register(&st->miscdev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (ret)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto o=
ut;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> Hmm so you want to map a page to userspace, but who will
> keep the clock in that memory page up to date?
> Making hypervisor do it will mean stealing a bunch
> of hypervisor time and we don't *know* userspace is
> going to use it.

I think it should scale OK. The bulk of the actual *calculations* are
done only once by the hypervisor on an NTP skew adjustment anyway,
rather than per-VM. That gives the period of the actual host counter,
and the reference time.

Where TSC scaling *isn't* occurring, all that the VMM needs to do is
copy that information, applying the appropriate TSC offset. I think it
should be mostly in the noise compared with other VMM overhead?

Where TSC scaling is in use, it's a little more complex. The counter
value at the reference time needs to be converted using the standard
mul-and-shift TSC scaling method. But the counter *period* needs to
undergo the reverse conversion. That would be a bit more work if done
na=C3=AFvely with a right shift and then a *division*, but an appropriate
efficient conversion to match the frequency scaling could be
precalculated, much as KVM already does in kvm_get_time_scale()? Then
the conversion of the counter period could just be a mul and shift too.

If it's just the TSC scaling which pushes it over the edge, then
*maybe* we could add the raw host=E2=86=92guest TSC scaling information to =
the
structure and make it the guest's problem? I'm not sure I'm overly fond
of that approach.

(You mention feature negotiation later, so we'll come back to that...)

> > +static const struct acpi_device_id vmclock_acpi_ids[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "VMCLOCK", 0 },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{}
> > +};
> > +MODULE_DEVICE_TABLE(acpi, vmclock_acpi_ids);
>=20
> This is also part of ABI.
> How do we know no one in the world happens to have a CID like this?
> We should just reserve a valid HID, I think.

Ack. This was largely just based on the existing VMGENID code. Can I
assign a QEMUxxxx HID for it?

> > +struct vmclock_abi {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* CONSTANT FIELDS */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t magic;
> > +#define VMCLOCK_MAGIC=C2=A0=C2=A00x4b4c4356 /* "VCLK" */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t size;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Size of region containin=
g this structure */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint16_t version;=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* 1 */
>=20
> I think we need to document how will compatibility be handled,
> otherwise people will just go
> (assert(size =3D=3D sizeof(struct vmclock_abi))
> and we can't extend it ever.

As you noted, the existing guest code only checks for it being large
*enough*. I've let this "specification" be implementation-led for the
time being, as I'm planning for Peter to accept it into the virtio-rtc
spec and for *that* to be the formal definition, where such admonitions
would reside.=20

> I also feel some kind of negotiation so host can detect guest
> expectations would be a good idea, basically a la virtio feature
> negotiation.
>=20
> Also, I think it's not great that host is just expected to
> poke at this memory at all times. Being able to know that e.g.
> system is being shut down and so no need to poke
> at memory would be good.

Fair enough. I think that when used in virtio-rtc, doing it through
feature negotiation is probably the right answer?

For the ACPI device, perhaps we can just add an ACPI method to
enable/disable the timekeeping (the disruption signal can always be
operational).


--=-Hh5AJCYJEgXbGuGNszvM
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNzI1MDk1NjA1WjAvBgkqhkiG9w0BCQQxIgQgJctIkNkm
+V4R2hSCHZrJtXI51BoiKnAP69cBtgsFW08wgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgB6sZLebi3i3k3Fv1IcDx6pBo7R4pt+LUCb
6Mdx90Afjqat7bM5OoycqvlBhSgmdIqredfrHLtyLhkswlrWjnR58XWOJgBL/euT6R9IsQB2bJHP
uVWu5vtZOn3kYjvDX2W7JERgwdZ8dDRTbjuI6r5V1lkTOw2tg0wCxtDZgoD4uPLxsw0GkkEWEsgT
orqa+C9kwKgzwUm97BQFyLO7F1zjo9BR2MPCFLeGuNkLtHg/JYOW1UIGIJ+m1chazpP26xSfe2Us
496slGAe+6incFZz14vHJwazfPImJ20tNumd1jHihmTt2lLeHcpme8A9IjwI1QXTDNA2vcpMGA+0
/jjDc5aLJsyGESvZnyO8MAMkLHSwHGU3Hhs6JCrOc4IAbO5BmoPq0me7eyjDhY1lworePKLZV4pY
Q/lpQFLJX4x4A0DC0tp0a1SDN3cBn2/P0rA5ZNb7E40qd4nNo6F2d7sZLbJ3JpOjdYth3QmonTJ6
0ZShE3A1f/I7bgfH+C/E9xl1FrPY/yTRGcoZKeEu6Zg6xONpd9KqhrK6VNCK5TTsNK2bxqSUA3tQ
Wforp95dmnm4Bd+jSgNLVlMueh2JG2J7ha/nca2YTP3ZM7T02op+Zc6Hd4PCIZHx3l8uaF0k1B6o
eOiCuSdM2WUEn/wxKRBSCkLah8d7JHpIJ+fB8O9IwQAAAAAAAA==


--=-Hh5AJCYJEgXbGuGNszvM--

